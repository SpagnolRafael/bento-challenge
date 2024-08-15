import 'package:bento_challenge/models/dto/banner_dto.dart';
import 'package:bento_challenge/models/dto/product_dto.dart';
import 'package:bento_challenge/screens/product/components/animated_favorite_icon.dart';
import 'package:bento_challenge/screens/product/product_bloc.dart';
import 'package:bento_challenge/screens/product/product_event.dart';
import 'package:bento_challenge/screens/product/product_state.dart';
import 'package:bento_challenge/screens/product/seal_component.dart';
import 'package:bento_challenge/shareds/app_button.dart';
import 'package:bento_challenge/shareds/app_error_widget.dart';
import 'package:bento_challenge/shareds/app_scaffold.dart';
import 'package:bento_challenge/shareds/app_snackbar.dart';
import 'package:bento_challenge/shareds/banner_carrousel.dart';
import 'package:bento_challenge/shareds/skeleton.dart';
import 'package:bento_challenge/utils/app_colors.dart';
import 'package:bento_challenge/utils/app_formatters.dart';
import 'package:bento_challenge/utils/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.id});
  final String id;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final bloc = GetIt.I.get<ProductBloc>();
  ProductDto? _product;
  void Function()? _onTryAgain;

  @override
  void initState() {
    super.initState();
    bloc.add(GetProductEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: BlocConsumer<ProductBloc, ProductState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is ProductStateSuccess) {
            _product = state.product;
          }

          if (state is ProductStateError) {
            _onTryAgain = state.onTryAgain;
            AppSnackbar.show(
                context: context,
                type: SnackType.error,
                content: const Text('An error occurred, try again'));
          }
        },
        builder: (context, state) {
          bool isLoading = state is ProductStateLoading;
          if (state is ProductStateError) {
            return Center(child: AppErrorWidget(onTryAgain: _onTryAgain));
          }
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppSkeleton(
                              isLoading: isLoading,
                              child: AppButton.action(
                                icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 16),
                                onTap: () => Navigator.pop(context),
                              ),
                            ),
                            AppSkeleton(
                              isLoading: isLoading,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.grey50,
                                ),
                                child: AnimatedFavoriteIcon(
                                    productId: _product?.id),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        AppSkeleton(
                            isLoading: isLoading,
                            child: BannerCarrousel(
                              height: 280,
                              banners: (_product?.images ?? [])
                                  .map((e) => BannerDto(url: e))
                                  .toList(),
                            )),
                        const SizedBox(height: 8),
                        AppSkeleton(
                          isLoading: isLoading,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                    isLoading
                                        ? '**************'
                                        : _product?.name ?? '-',
                                    style: const TextStyle(
                                        fontSize: 22,
                                        color: AppColors.blue800,
                                        fontWeight: FontWeight.bold)),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey[200]!, width: .6),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.star,
                                        size: 20, color: Colors.yellow[700]),
                                    const SizedBox(width: 4),
                                    Text(
                                        isLoading
                                            ? '***'
                                            : (_product?.rating ?? 0)
                                                .toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        AppSkeleton(
                          isLoading: isLoading,
                          child: Text(
                              'Shop: ${isLoading ? '******' : (_product?.shop ?? '-')}',
                              style: AppTextStyle.roboto.copyWith(
                                  color: AppColors.blue800.withOpacity(0.8),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12)),
                        ),
                        const SizedBox(height: 16),
                        SealComponent(
                            isLoading: isLoading,
                            categories: _product?.categories ?? []),
                        const SizedBox(height: 16),
                        AppSkeleton(
                          isLoading: isLoading,
                          child: const Text('Details',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blue800,
                              )),
                        ),
                        const SizedBox(height: 8),
                        AppSkeleton(
                          isLoading: isLoading,
                          child: Text(
                            isLoading
                                ? '******************************************************************************************************************************************************************************'
                                : _product?.description ?? '-',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.blue800),
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(height: 32, color: Colors.grey[200]),
              AppSkeleton(
                isLoading: isLoading,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Price',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey100)),
                          Row(
                            children: [
                              Text(
                                  '\$${AppFormatters.money(((_product?.value ?? 0) - (_product?.discount ?? 0)).toString())}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: AppColors.blue800,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(width: 8),
                              Text(
                                  '\$${AppFormatters.money((_product?.value ?? 0).toString())}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey[400],
                                      decoration: TextDecoration.lineThrough)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                        child: AppButton.primary(
                      text: 'Add to Cart',
                      textColor: AppColors.blue800,
                      onTap: () {},
                    ))
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          );
        },
      ),
    );
  }
}

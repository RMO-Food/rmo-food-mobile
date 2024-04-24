import 'package:get_it/get_it.dart';
import 'package:rmo_food/infrastructure/repository/http_api_repo_impl.dart';
import 'package:rmo_food/service/http_executer.dart';
import 'package:rmo_food/src/pages/services/menu/bloc/orderflow/orderflow_cubit.dart';

final GetIt getIt = GetIt.instance;

void setUpLocator() async {
  getIt.registerSingleton<HttpApiRepoImpl>(HttpApiRepoImpl());

  getIt.registerFactory<HttpExecuter>(() => HttpExecuter());

  getIt.registerFactory<OrderflowCubit>(() => OrderflowCubit());
}

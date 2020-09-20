import 'package:NewsApp308/models/categorymodel.dart';

List<CategoryModel> getcategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel;
  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "business";
  categoryModel.Catedisname = "Business";
  categoryModel.ImageUrl =
      "https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=60";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "entertainment";
  categoryModel.Catedisname = "Entertainment";
  categoryModel.ImageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "sports";
  categoryModel.Catedisname = "Sports";
  categoryModel.ImageUrl =
      "https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=60";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "technology";
  categoryModel.Catedisname = "Technology";
  categoryModel.ImageUrl =
      "https://images.unsplash.com/photo-1512756290469-ec264b7fbf87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=60";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "health";
  categoryModel.Catedisname = "Health";
  categoryModel.ImageUrl =
      "https://images.unsplash.com/photo-1583947582886-f40ec95dd752?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=60";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = "science";
  categoryModel.Catedisname = "Science";
  categoryModel.ImageUrl =
      "https://images.unsplash.com/photo-1517976487492-5750f3195933?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80";
  category.add(categoryModel);

  return category;
}

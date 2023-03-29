package pl.coderslab.category;

public interface CategoryService {
    void addCategory(Category category);
    void deleteCategory(Long id);
    void editCategory(Category category);
    Category getCategory(Long id);
}

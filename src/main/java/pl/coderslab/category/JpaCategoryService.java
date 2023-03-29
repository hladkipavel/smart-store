package pl.coderslab.category;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Primary
@RequiredArgsConstructor
public class JpaCategoryService implements CategoryService{
    private final CategoryRepository categoryRepository;
    @Override
    public void addCategory(Category category) {
        categoryRepository.save(category);
    }

    @Override
    public void deleteCategory(Long id) {
        categoryRepository.deleteById(id);
    }

    @Override
    public void editCategory(Category category) {
        categoryRepository.save(category);
    }

    @Override
    public Category getCategory(Long id) {
        return categoryRepository.getOne(id);
    }

    public List<Category> showAllCategory(){
        return categoryRepository.findAll();
    }
}

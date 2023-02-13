package pl.coderslab.user;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

@Service
@Primary
@RequiredArgsConstructor
public class JpaUserService implements UserService{
    private final UserRepository userRepository;

    @Override
    public void addUser(User user) {
        userRepository.save(user);
    }

    @Override
    public void deleteUser(Long userId) {
        User user = userRepository.getOne(userId);
        userRepository.delete(user);
    }

    @Override
    public User getUser(Long userId) {
        return userRepository.getOne(userId);
    }

    @Override
    public void editUser(User user) {
        userRepository.save(user);
    }
}

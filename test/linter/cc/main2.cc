
int main(int argc, char *argv[]) {
  // Bad Idea
  for (int i = 0; i < 15; i++) {
    std::cout << i << std::endl;
  }

  // Good Idea
  for (int i = 0; i < 15; ++i) {
    std::cout << i << std::endl;
  }

  return 0;
}

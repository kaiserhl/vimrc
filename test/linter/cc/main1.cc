
#include <iostream>

// Bad Idea
class MyClass {
 public:
  MyClass(std::string t_value) : m_value(t_value) {}

  std::string get_value() { return m_value; }

 private:
  std::string m_value;
}

// Good Idea
class MyClass {
 public:
  MyClass(const std::string &t_value) : m_value(t_value) {}

  std::string get_value() const { return m_value; }

 private:
  std::string m_value;
}

int main(int argc, char *argv[]) {

  return 0;
}

/* Convert copy&paste chess game from server web to pgn
 *
 */
#include <iostream>
#include <fstream>
#include <sstream>

int main(int argc, char* argv[])
{
  std::ifstream ifs;
  if (argc >= 2) {
      ifs.open(argv[1]);
    }
  std::istream inps(argc >= 2 ? ifs.rdbuf() : std::cin.rdbuf());

  std::ofstream ofs;
  if (argc == 3) {
      ofs.open(argv[2]);
    }
  std::ostream outs(argc == 3 ? ofs.rdbuf() : std::cout.rdbuf());

  std::istreambuf_iterator<char> eos;
  std::string buf(std::istreambuf_iterator<char>(inps), eos);

  bool ignore {false};
  for (auto& c : buf) {
      auto t = c;
      if (c == '{') ignore = true;
      if (ignore) c = ' ';
      if (t == '}') ignore = false;
    }

  std::istringstream istrs(buf);
  std::string word;
  istrs >> word;
  outs  << word;

  while (istrs >> word) {
      if (word.length() > 3) {
          auto i = word.rbegin();
          auto a = *i++ == '.';
          auto b = *i++ == '.';
          auto c = *i++ == '.';
          if (a && b && c) continue;
        }
      outs << ' ' << word;
    }
  outs << '\n';

  return 0;
}

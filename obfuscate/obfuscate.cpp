#include <cstdint>
#include <utility>
#include <fstream>

using namespace std;

int main(int /*argc*/, char* argv[])
{
  char buffer[1024*1024];

  fstream inp(argv[1], ios::binary | ios::in);
  fstream out(argv[2], ios::binary | ios::out);

  for (;;) {
    inp.read(buffer, sizeof buffer);
    std::streamsize k = inp.gcount();
    if (k == 0) break;

    for (std::streamsize i=0, j=k/3+2; j < k; i++, j += 2) {
      std::swap(buffer[i], buffer[j]);
    }

    for (std::streamsize i=0; i<k; i++) {
      buffer[i] = char(~std::uint8_t(buffer[i]));
    }
    out.write(buffer, k);
  }

  return 0;
}

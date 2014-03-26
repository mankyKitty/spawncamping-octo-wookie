/* readimage.c++ */

#include <iostream>
#include <fstream>

#include <opencv2/opencv.h>

using namespace std;

ifstream::pos_type size;
char * memblock;

int main() {
  ifstream file;
  file.open("link.bmp", ios::binary);

  if (file.is_open()) {
    size = file.tellg();
    memblock = new char[size];

    file.seekg(0, ios::beg);
    file.read(memblock, size);
    file.close();

    cout << "the complete file is in memory" << endl;

    cout << sizeof(memblock) << endl;

    delete[] memblock;
  }

  return 0;
}

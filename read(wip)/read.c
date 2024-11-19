#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  FILE *file;
  char *buffer;
  long file_size;

  // Open the file in read mode
  file = fopen("garbage.txt", "r");
  if (file == NULL) {
    perror("Error opening file");
    return 1;
  }

  // Move the file pointer to the end of the file to determine the size
  fseek(file, 0, SEEK_END);
  file_size = ftell(file);
  rewind(file);

  // Allocate memory to store the file contents
  buffer = (char *)malloc(file_size + 1); // +1 for the null terminator
  if (buffer == NULL) {
    perror("Error allocating memory");
    fclose(file);
    return 1;
  }

  // Read the file contents into the buffer
  fread(buffer, 1, file_size, file);
  buffer[file_size] = '\0'; // Null-terminate the string

  // Print the contents (optional)
  printf("File Contents:\n%s\n", buffer);

  // Cleanup
  fclose(file);
  free(buffer);
  return 0;
}

package main

import (
  "fmt"
  "errors"
  "io/ioutil"
)

/**
 * ## Just trying to load our config file for use.
 */
func getFile(filename string) (*[]bytes, error) {
  contents, err := ioutil.ReadFile(filename)
  // Return a reference to the open file
  return &contents, err
}

/**
 * ## Commented line filter
 *
 * This function only returns a line if it is not
 * a commented line.
 */
func filterCommented(line string) string {
  if line != nil {
    if string[0] == '#' {
      return nil
    }
    else {
      return line
    }
  }
}

/**
 * #Load the configuration into a map with string keys.
 *
 * Currently no support for loading the configuration options into
 * their respective types, but that should all come in good time.
 *
 * ### Parameters
 * @param fname string - the file name with absolute path to the
 *                     config file in question
 *
 * @param dest *map[string]string - the destination for the config
 *                                options when they are loaded form
 *                                the file. Keys are strings, and values
 *                                are all strings for now.
 */
func LoadConfig(fname string) ([]string, error) {
  // Get the file.
  conf, err := getFile(fname)
  // _Be responsible and check for errors._
  if err != nil {
    return nil,err
  }
  // ### Parse the file.
  lines := strings.Map(filterCommented, strings.Split(conf, '\n'))

  return lines, err
}

/**
 * ## Testing the loading
 */
func main() {
  file := "test.conf"
  conf,err := LoadConfig(file)

  if err != nil {
    fmt.Println(err)
  }
  fmt.Println(conf)
}


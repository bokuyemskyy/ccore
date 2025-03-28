# Project README

## Overview

This repository provides a structured and scalable foundation for building and expanding any middle-sized C++/C project. 
In the future, it aims to streamline the development process to be easily adapted and extended to suit the specific needs of your project.

## Features

- **Project Structure**: Conveniently configured for scalability and ease of navigation.
- **Container Setup**: Preconfigured `release` Docker container and `devcontainer` for efficient development and deployment.
- **Dependency Management**: Integrated VCPKG to simplify external library management.
- **Code Quality**: Using Clang-family tools (clangd, clang-tidy, clang-format) to lint, format and analyze the codebase to ensure consistent code style and prevent issues.
- **Build System**: Nested CMake structure with Ninja for fast builds.
- **Testing**: Google Test (`gtest`) preconfigured for unit testing.
- **Debugger**: Preconfigured GDB debugging setup for easier troubleshooting.

## Some details
### Project structure in a nutshell
- /.devcontainer: VSCode devcontainer configuration
- /.vscode: VSCode debugging, linting and editor configurations
- /docker: Dockerfiles for both development and release containers
- /project: your project itself
- /vcpkg_installed: VCPKG folder for your dependencies

### Dependency editing
To add a VCPKG dependency to the project - modify 'vcpkg.json' mafinest file, adding a new line to "dependencies" list. Then, modify the corresponding CMakeLists.txt to include the library.

### Container editing
If you faced a need to add a new package to either one of the containers - just edit the 'apt get' block.

## Build Instructions

1. To set up the project, run:
   ```bash
   cmake . --preset default
   ```
2. To build your project in either debug or release mode, use:
   ```bash
   cmake --build build --preset debug   # For Debug Mode
   cmake --build build --preset release # For Release Mode
   ```

## Status

This project is not yet in its final version and will continue to be improved. Many features are going to be implemented soon, so you can expect ongoing updates and refinements until the project is good enough.

## Contribution

Feel free to contribute by submitting issues or pull requests. This repository is open to enhancements and improvements from the community. 

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to modify or extend this foundation according to your specific project requirements!
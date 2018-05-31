# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- This CHANGELOG file to track changes in the project over time.
- Antigen plugin manager for zsh
- Created simple task manager with bash and zsh completion

### Changed

- Moved all pip packages that you can to pacman and aur equivalent packages for
  less messy updating through pacman
- Refreshed command line pinning script

## [0.1.1] - 2018-05-22

### Added

- Installation commands for `r` and `pip` packages

### Changed

- You now run make with `sudo` so you don't have to keep typing your password
  while the installation runs due to it timing out.
- Better checking of necessary folders or existing configuration files before
  syncing the git ones to the machine.

## 0.1.0 - 2018-05-21

### Added

- Makefile that installs all pacman and aur packages along with using GNU stow
  to put the necessary configuration files in place to get up and running with
  my Linux rice.

[Unreleased]: ../../compare/v0.1.1...HEAD
[0.1.1]: ../../compare/v0.1.0...v0.1.1

# Build with Gradle

[![CircleCI](https://circleci.com/gh/Praqma/native-example-gradle.png?style=shield&circle-token=df3dc5f6efbc2a267f7805f05a5e91d2878be9fd)](https://circleci.com/gh/Praqma/native-example-gradle)
![TravisCI Status](https://travis-ci.org/Praqma/native-example-gradle.svg?branch=master)

![](https://img.shields.io/github/stars/praqma/native-example-gradle.svg)
![](https://img.shields.io/github/forks/praqma/native-example-gradle.svg)
![](https://img.shields.io/github/watchers/praqma/native-example-gradle.svg)
![](https://img.shields.io/github/tag/praqma/native-example-gradle.svg)
![](https://img.shields.io/github/release/praqma/native-example-gradle.svg)
![](https://img.shields.io/github/issues/praqma/native-example-gradle.svg)

Building with [Gradle](https://gradle.org/).

See [native](https://github.com/Praqma/native) repository for more examples.

## Steps

* Build image: `./dockerize.sh`
* Run container: `./containerize.sh`
* Build example (inside container): `./build.sh`
* Test example (inside container): `./test.sh`

## Todo

* [x] ~~Use static libraries.~~

## Lesson Learned

### The `undefined reference to ``main'` error. 

We did not include the Google {Test,Mock} directly as `NativeLibrarySpec` into Gradle environment.
For each `NativeExecutableSpec` and `NativeLibrarySpec` defined in your project, Gradle will create a matching `GoogleTestTestSuiteSpec` component,named `${component.name}Test`.<sup>[Reference](https://docs.gradle.org/current/userguide/native_software.html#native_binaries:google_test)</sup>
It has caused undefined main entry point.

Google Test Error
```
See file:///workspace/build/tmp/linkGtestTestGoogleTestExe/output.txt for all output for linkGtestTestGoogleTestExe.
linking gtestTest failed.
/usr/lib/gcc/x86_64-linux-gnu/6/../../../x86_64-linux-gnu/Scrt1.o: In function `_start':
(.text+0x20): undefined reference to `main'
collect2: error: ld returned 1 exit status

Finished linkGtestTestGoogleTestExe, see full log file:///workspace/build/tmp/linkGtestTestGoogleTestExe/output.txt.
```

Google Mock Error
```
See file:///workspace/build/tmp/linkGmockTestGoogleTestExe/output.txt for all output for linkGmockTestGoogleTestExe.
linking gmockTest failed.
/usr/lib/gcc/x86_64-linux-gnu/6/../../../x86_64-linux-gnu/Scrt1.o: In function `_start':
(.text+0x20): undefined reference to `main'
collect2: error: ld returned 1 exit status

Finished linkGmockTestGoogleTestExe, see full log file:///workspace/build/tmp/linkGmockTestGoogleTestExe/output.txt.
```
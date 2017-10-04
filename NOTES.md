# Notes

## Lesson Learned

* The ``undefined reference to `main'`` error.

We did not include the Google {Test,Mock} as `NativeLibrarySpec` _directly_ into Gradle environment.
For each `NativeExecutableSpec` and `NativeLibrarySpec` defined in your project, Gradle will create a matching `GoogleTestTestSuiteSpec` component,named `${component.name}Test`. It has caused undefined main entry point. Read [documentation](https://docs.gradle.org/current/userguide/native_software.html#native_binaries:google_test) for more information.

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

Workaround:

Use `build-googletest.sh` or `build-googlemock.sh` helper scripts to build Google {Test,Mock} before build and test steps.
Update `build.gradle` to use `PrebuiltLibraries` to include the prebuilt Google {Test,Mock}.

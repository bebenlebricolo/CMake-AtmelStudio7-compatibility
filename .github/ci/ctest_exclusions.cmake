set(test_exclusions
  # This test hits global resources and can be handled by nightly testing.
  # https://gitlab.kitware.com/cmake/cmake/-/merge_requests/4769
  "^BundleGeneratorTest$"
)

if (CTEST_CMAKE_GENERATOR MATCHES "Visual Studio")
  list(APPEND test_exclusions
    # This test takes around 5 minutes with Visual Studio.
    # https://gitlab.kitware.com/cmake/cmake/-/issues/20733
    "^ExternalProjectUpdate$"
    # This test is a dependency of the above and is only required for it.
    "^ExternalProjectUpdateSetup$"

    # The following 3 tests fail because of a runtime environment which mismatches a
    # bit while running within github windows image. Might need further tweaking for them to pass!
    "^ExternalProject$"
    "^ExternalProjectLocal$"
    "^RunCMake.BuildDepends$"
    "^RunCMake.FindPkgConfig$"
    "^RunCMake.AutoExportDll$"
    "^RunCMake.CSharpReferenceImport$"
    )
endif ()

string(REPLACE ";" "|" test_exclusions "${test_exclusions}")
if (test_exclusions)
  set(test_exclusions "(${test_exclusions})")
endif ()

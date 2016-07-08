Swift Typecheck Crash Reproducer
================================

This project crashes while compiling, at least when compiling with Swift 3
Preview 2 under Linux. To reproduce, simply run the following command:

    swift build


Output of swiftc:

Compile Swift Module 'Crash' (1 sources)
0  swift           0x00000000032f24e8 llvm::sys::PrintStackTrace(llvm::raw_ostream&) + 40
1  swift           0x00000000032f0ce6 llvm::sys::RunSignalHandlers() + 54
2  swift           0x00000000032f3016
3  libpthread.so.0 0x00007f1118275d40
4  swift           0x00000000010c135a swift::GenericSignature::getInnermostGenericParams() const + 10
5  swift           0x0000000000f01300 swift::TypeChecker::applyUnboundGenericArguments(swift::UnboundGenericType*, swift::SourceLoc, swift::DeclContext*, llvm::MutableArrayRef<swift::TypeLoc>, bool, swift::GenericTypeResolver*) + 448
6  swift           0x0000000000f00fc5 swift::TypeChecker::applyGenericArguments(swift::Type, swift::SourceLoc, swift::DeclContext*, swift::GenericIdentTypeRepr*, bool, swift::GenericTypeResolver*) + 469
7  swift           0x0000000000f0bd6c
8  swift           0x0000000000f0a858
9  swift           0x0000000000f01dab
10 swift           0x0000000000f019ce swift::TypeChecker::resolveIdentifierType(swift::DeclContext*, swift::IdentTypeRepr*, swift::OptionSet<swift::TypeResolutionFlags, unsigned int>, bool, swift::GenericTypeResolver*, llvm::function_ref<bool (swift::TypeCheckRequest)>*) + 158
11 swift           0x0000000000f02bb0
12 swift           0x0000000000f02aa4 swift::TypeChecker::resolveType(swift::TypeRepr*, swift::DeclContext*, swift::OptionSet<swift::TypeResolutionFlags, unsigned int>, swift::GenericTypeResolver*, llvm::function_ref<bool (swift::TypeCheckRequest)>*) + 164
13 swift           0x0000000000f018c0 swift::TypeChecker::validateType(swift::TypeLoc&, swift::DeclContext*, swift::OptionSet<swift::TypeResolutionFlags, unsigned int>, swift::GenericTypeResolver*, llvm::function_ref<bool (swift::TypeCheckRequest)>*) + 192
14 swift           0x0000000000ea7b04
15 swift           0x0000000000e98070
16 swift           0x0000000000e97d26 swift::TypeChecker::typeCheckDecl(swift::Decl*, bool) + 150
17 swift           0x0000000000eb9872 swift::performTypeChecking(swift::SourceFile&, swift::TopLevelContext&, swift::OptionSet<swift::TypeCheckingFlags, unsigned int>, unsigned int, unsigned int) + 1026
18 swift           0x0000000000c5786b swift::CompilerInstance::performSema() + 3515
19 swift           0x00000000007d61b3
20 swift           0x00000000007d52d1 swift::performFrontend(llvm::ArrayRef<char const*>, char const*, void*, swift::FrontendObserver*) + 2833
21 swift           0x00000000007a22ab main + 2603
22 libc.so.6       0x00007f1116bd85f0 __libc_start_main + 240
23 swift           0x000000000079fe29 _start + 41
Stack dump:
0.	Program arguments: /tmp/swift-3.0-PREVIEW-2-ubuntu15.10/usr/bin/swift -frontend -c -primary-file /tmp/swift-repro/Sources/Crash/crash.swift -target x86_64-unknown-linux-gnu -disable-objc-interop -I /tmp/swift-repro/.build/debug -enable-testing -g -module-cache-path /tmp/swift-repro/.build/debug/ModuleCache -D SWIFT_PACKAGE -emit-module-doc-path /tmp/swift-repro/.build/debug/Crash.build/crash~partial.swiftdoc -Onone -parse-as-library -module-name Crash -emit-module-path /tmp/swift-repro/.build/debug/Crash.build/crash~partial.swiftmodule -emit-dependencies-path /tmp/swift-repro/.build/debug/Crash.build/crash.d -emit-reference-dependencies-path /tmp/swift-repro/.build/debug/Crash.build/crash.swiftdeps -num-threads 8 -o /tmp/swift-repro/.build/debug/Crash.build/crash.swift.o 
1.	While type-checking 'createResult' at /tmp/swift-repro/Sources/Crash/crash.swift:3:9
2.	While resolving type Result<String.UnicodeScalarView, String.UnicodeScalarView> at [/tmp/swift-repro/Sources/Crash/crash.swift:6:6 - line:6:63] RangeText="Result<String.UnicodeScalarView, String.UnicodeScalarView>"
<unknown>:0: error: unable to execute command: Segmentation fault
<unknown>:0: error: compile command failed due to signal (use -v to see invocation)

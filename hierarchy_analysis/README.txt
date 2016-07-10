To reproduce, simply run the following command:

    swift build

Compile Swift Module 'Core' (1 sources)
Compile Swift Module 'Crash' (1 sources)
swift: /source/swift/include/swift/Serialization/ModuleFile.h:362: Status swift::ModuleFile::error(Status): Assertion `(!FileContext || issue != Status::Malformed) && "error deserializing an individual record"' failed.
0  swift           0x00000000033545b8 llvm::sys::PrintStackTrace(llvm::raw_ostream&) + 40
1  swift           0x0000000003352db6 llvm::sys::RunSignalHandlers() + 54
2  swift           0x00000000033550e6
3  libpthread.so.0 0x00007f3b9a37dd40
4  libc.so.6       0x00007f3b98cf3458 gsignal + 56
5  libc.so.6       0x00007f3b98cf48da abort + 362
6  libc.so.6       0x00007f3b98cec387
7  libc.so.6       0x00007f3b98cec432
8  swift           0x0000000000dd0cb9 swift::ModuleFile::resolveCrossReference(swift::ModuleDecl*, unsigned int) + 6057
9  swift           0x0000000000dc29d6 swift::ModuleFile::getDecl(llvm::PointerEmbeddedInt<unsigned int, 31>, llvm::Optional<swift::DeclContext*>) + 11334
10 swift           0x0000000000dcaed9 swift::ModuleFile::getType(llvm::PointerEmbeddedInt<unsigned int, 31>) + 7945
11 swift           0x0000000000dc9dbf swift::ModuleFile::getType(llvm::PointerEmbeddedInt<unsigned int, 31>) + 3567
12 swift           0x0000000000dc9dac swift::ModuleFile::getType(llvm::PointerEmbeddedInt<unsigned int, 31>) + 3548
13 swift           0x0000000000dcacc9 swift::ModuleFile::getType(llvm::PointerEmbeddedInt<unsigned int, 31>) + 7417
14 swift           0x0000000000dc9dbf swift::ModuleFile::getType(llvm::PointerEmbeddedInt<unsigned int, 31>) + 3567
15 swift           0x0000000000dc9914 swift::ModuleFile::getType(llvm::PointerEmbeddedInt<unsigned int, 31>) + 2372
16 swift           0x0000000000dc7106 swift::ModuleFile::getDecl(llvm::PointerEmbeddedInt<unsigned int, 31>, llvm::Optional<swift::DeclContext*>) + 29558
17 swift           0x0000000000d5e3d7 swift::ModuleFile::getTopLevelDecls(llvm::SmallVectorImpl<swift::Decl*>&) + 647
18 swift           0x000000000113543f swift::ModuleDecl::getTopLevelDecls(llvm::SmallVectorImpl<swift::Decl*>&) const + 47
19 swift           0x0000000000ba98c6 swift::ClassHierarchyAnalysis::init() + 70
20 swift           0x0000000000b9d9f4 swift::createClassHierarchyAnalysis(swift::SILModule*) + 84
21 swift           0x0000000000a33437 swift::SILPassManager::SILPassManager(swift::SILModule*, llvm::StringRef) + 423
22 swift           0x0000000000a40023 swift::runSILDiagnosticPasses(swift::SILModule&) + 115
23 swift           0x0000000000823dea
24 swift           0x000000000081fcc1 swift::performFrontend(llvm::ArrayRef<char const*>, char const*, void*, swift::FrontendObserver*) + 2833
25 swift           0x00000000007eccab main + 2603
26 libc.so.6       0x00007f3b98ce05f0 __libc_start_main + 240
27 swift           0x00000000007ea829 _start + 41
Stack dump:
0.	Program arguments: /tmp/swift/usr/bin/swift -frontend -emit-module /tmp/repro/.build/debug/Crash.build/crash~partial.swiftmodule -parse-as-library -target x86_64-unknown-linux-gnu -disable-objc-interop -I /tmp/repro/.build/debug -enable-testing -g -module-cache-path /tmp/repro/.build/debug/ModuleCache -D SWIFT_PACKAGE -emit-module-doc-path /tmp/repro/.build/debug/Crash.swiftdoc -module-name Crash -o /tmp/repro/.build/debug/Crash.swiftmodule 
1.	While reading from /tmp/repro/.build/debug/Crash.build/crash~partial.swiftmodule
2.	While deserializing 'crash' (FuncDecl #20) 
3.	While deserializing decl #53 (XREF)
4.	Cross-reference to module 'Core'
	... B
	... generic param #0
<unknown>:0: error: unable to execute command: Aborted
<unknown>:0: error: merge-module command failed due to signal (use -v to see invocation)

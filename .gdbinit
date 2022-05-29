!rm -rf ./test.log
set auto-solib-add off
set breakpoint pending on
set pagination off
set print pretty
set logging file ./test.log
set logging on

skip -rfu std::.*
skip -rfu std::.*::.*
skip -rfu __.*
#skip -gfi /lib64*

b main

define xx
    sharedlibrary driver
    sharedlibrary hc.so
end

define ss
    bt
    s
end

run
xx

while 1
    ss
end
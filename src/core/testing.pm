my $test_counter       := 0;
my $todo_upto_test_num := 0;
my $todo_reason        := '';

sub plan($quantity) {
    say("1..$quantity");
}

sub ok($condition, $desc?) {
    $test_counter := $test_counter + 1;

    unless $condition {
        print("not ");
    }
    print("ok $test_counter");
    if $desc {
        print(" - $desc");
    }
    if $test_counter <= $todo_upto_test_num {
        print($todo_reason);
    }
    print("\n");
    
    $condition ?? 1 !! 0
}

sub todo($reason, $count) {
    $todo_upto_test_num := $test_counter + $count;
    $todo_reason        := "# TODO $reason";
}

sub skip($desc) {
    $test_counter := $test_counter + 1;
    say("ok $test_counter # SKIP $desc\n");
}

# vim: ft=perl6

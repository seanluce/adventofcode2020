function test-gold {
    param ($colorname)
    $data = get-content "input.txt"
    foreach ($rule in $data) {
        $splitrule = $rule.split("contain")
        $container = $splitrule[0].split(' bags')[0]
        if ($container -eq $colorname) {
            #$container
            $contents = $splitrule[1].split(',')
            foreach ($item in $contents) {
                $qty = $item.substring(1,1)
                if ($qty -eq 'n') {
                    $qty = 0
                }
                $qty | out-file "totalcount.txt" -append
                #$item
                #$qty
                $item = $item.substring(3).split(' bags')[0]
                $item = $item.split(' bag')[0]
                for($i = 0; $i -lt $qty; $i++) {
                    test-gold("$item")
                }
            }
        }
    }
}

get-date

out-file "totalcount.txt"

test-gold("shiny gold")

$bagcounts = get-content "totalcount.txt"

foreach ($bag in $bagcounts) {
    $total += [int]$bag
}

$total

get-date

function test-gold {
    param ($colorname)
    $data = get-content "input.txt"
    foreach ($rule in $data) {
        #'Rule: ' + $rule
        $match = 0
        $splitrule = $rule.split("contain")
        $container = $splitrule[0].split(' bags')[0]
            $contents = $splitrule[1].split(',')
            foreach ($item in $contents) {
                $qty = $item.substring(1,1)
                if ($qty -eq 'n') {
                    $qty = 0
                }
                $item = $item.substring(3).split(' bags')[0]
                $item = $item.split(' bag')[0]
                if ($item -eq $colorname) {
                    $match = 1
                }
            }
            if ($match -eq 1) {
                #$grandtotal++
                $container | out-file "matches.txt" -append
                $container
                test-gold("$container")
            }
        
    }
}

out-file "matches.txt"

test-gold("shiny gold")

$colors = get-content "matches.txt"

$total = $colors | sort-object | get-unique

#'---'
$total.count

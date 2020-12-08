$program = Get-Content "input.txt"
$programlength = $program.count
$swappedornot = @()
$troubletest = 0
$exitcode = 1
$lastreplaced = -1
'Program Length: ' + $programlength
'Accumulator   : ' + $acc



for($i = 1; $i -le $programlength; $i++) {
    $swappedornot += 0
}

while ($exitcode -eq 1) {
    $currentstep = 0
    $acc = 0
    $ranornot = @()
    for($i = 1; $i -le $programlength; $i++) {
        $ranornot += 0
    }
    while($currentstep -le $programlength-1) {   
        if ($ranornot[$currentstep] -eq 1) {
            break
            $exitcode = 1
        }
        $stepsplit = $program[$currentstep].split(' ')
        $ranornot[$currentstep] = 1
        $command = $stepsplit[0]
        $number = $stepsplit[1]
        '' + $currentstep + ' ' + $command + ' ' + $number
        switch($command) {
            'jmp' {
                $currentstep += $number
            }
            'nop' {
                $currentstep++
            }
            'acc' {
                $acc += $number
                $currentstep++
            }
        }
    }
    if ($ranornot[$programlength-1] -eq 1){
        $exitcode = 0
        break
    }
    else {
        $exitcode = 1
        '*** Initiate Repair Protocol ***'
        if ($lastreplaced -gt -1) {
            switch($program[$lastreplaced].split(' ')[0]) {
                'jmp' {
                    $program[$lastreplaced] = $program[$lastreplaced].replace('jmp', 'nop')
                }
                'nop' {
                    $program[$lastreplaced] = $program[$lastreplaced].replace('nop', 'jmp')
                }
            }
        }
        if ($swappedornot[$troubletest] -eq 0) { #not yet tested
            $swappedornot[$troubletest] = 1
            switch($program[$troubletest].split(' ')[0]) {
                'jmp' {
                    $program[$troubletest] = $program[$troubletest].replace('jmp', 'nop')
                    $lastreplaced = $troubletest
                    $program[$troubletest]
                }
                'nop' {
                    $program[$troubletest] = $program[$troubletest].replace('nop', 'jmp')
                    $lastreplaced = $troubletest
                    $program[$troubletest]
                }
            } 
            $troubletest++
            if($troubletest -lt $programlength-1) {
                while ($program[$troubletest].split(' ')[0] -ne 'jmp' -and $program[$troubletest].split(' ')[0] -ne 'nop') {
                    $troubletest++
                }
            }
        }
    }
}

if ($exitcode -eq 0) {
    'Program Terminated Successfully.'
}
else {
    'Program Did Not Terminate'
} 

'Accumulator: ' + $acc
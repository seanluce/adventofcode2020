$data = get-content input.txt -raw
$nl = [System.Environment]::NewLine
$splitdata = $data.split("$nl$nl")
$validrecords = 0
foreach ($record in $splitdata) {
    if ($record -like '*byr*' -and $record -like '*iyr*' -and $record -like '*eyr*' -and $record -like '*hgt*' -and $record -like '*hcl*' -and $record -like '*ecl*' -and $record -like '*pid*') {
        $splitrecord = $record.split(' ').split("$nl")
            $d = @{}
            foreach ($row in $splitrecord) {
                $rowdetail = $row.split(':')
                $d.Add($rowdetail[0], $rowdetail[1])
            }
            if ($d["byr"] -match '\d\d\d\d' -and $d['byr'] -ge 1920 -and $d['byr'] -le 2002) {
                if ($d["iyr"] -match '\d\d\d\d' -and $d['iyr'] -ge 2010 -and $d['iyr'] -le 2020) {
                    if ($d["eyr"] -match '\d\d\d\d' -and $d['eyr'] -ge 2020 -and $d['eyr'] -le 2030) {
                        if ($d["pid"] -match '\d\d\d\d\d\d\d\d\d' -and $d["pid"].Length -eq 9) {
                            if ($d["ecl"] -eq 'amb' -or $d["ecl"] -eq 'blu' -or $d["ecl"] -eq 'brn' -or $d["ecl"] -eq 'gry' -or $d["ecl"] -eq 'hzl' -or $d["ecl"] -eq 'oth' -or $d["ecl"] -eq 'grn') {
                                if ($d["hcl"] -match "#([0-9]|[a-f])([0-9]|[a-f])([0-9]|[a-f])([0-9]|[a-f])([0-9]|[a-f])([0-9]|[a-f])" -and $d["hcl"].Length -eq 7) {
                                        if ($d["hgt"] -like '*in*') {
                                            $num = $d["hgt"].Substring(0,$d["hgt"].length-2)
                                            if ([int]$num -ge 59 -and [int]$num -le 76) {
                                                $d
                                                "$n1$n1"
                                                $validrecords++
                                            }
                                        } 
                                        if ($d["hgt"] -like '*cm*') {
                                            $num = $d["hgt"].Substring(0,$d["hgt"].length-2)
                                            if ([int]$num -ge 150 -and [int]$num -le 193) {
                                                $d
                                                "$n1$n1"
                                                $validrecords++
                                            }
                                        }
                                }
                            }
                        } 
                    }  
                }   
            }      
            
    }
}
$validrecords
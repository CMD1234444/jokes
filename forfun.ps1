function Print($message) {
    foreach ($char in $message.ToCharArray()) {
		Write-Host -NoNewline $char
		Start-Sleep -Milliseconds 40
	}
}
$quote = "the lone wolf dies but the pack survives"
$answers = @("Ned", "Eddard", "Ned Stark", "Eddard Stark","the lord of winterfell")
Print $quote
$count = 0
do {
	$count += 1
	if ($count%10 -eq 0) {
		Print "`nIt's your attempt number ${count}. Try harder! "
	}
	if ($count -ne 1) {
		Print "`nnah "
	}
	Print "`nSay My Name:"
	$response = Read-Host
} while (-not ($answers -contains $response))
Print "`nBlue Crystal Clear! "
Print "`nWhat's your name? "
$name = Read-Host
Print "Hello, $name! Welcome to my script."
Print "`n type 'quit' to exit, or press Enter to keep the jokes rolling: "
Write-Host "`n"
$jokesSeen = @()
do {
	$joke = Invoke-RestMethod -Uri "https://icanhazdadjoke.com" -Headers @{Accept="text/plain"}
	while ($jokesSeen -contains $joke) {
        $joke = Invoke-RestMethod -Uri "https://icanhazdadjoke.com" -Headers @{Accept="text/plain"}
    }
    $jokesSeen += $joke
	Print $joke
	$again = Read-Host
} while ($again -ne "quit")
Print "`nGoodbye, $name! Have a great day!"

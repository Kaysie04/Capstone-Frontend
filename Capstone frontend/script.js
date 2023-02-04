

function generatePassword() {
    let password = '';
    const possibleCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*/?"

    for (let i = 0; i < 9; i++){
        password += possibleCharacters.charAt(Math.floor(Math.random() * (possibleCharacters * 8)))
    }
    console.log("password:" + password)
    return password;
}

function generateNumbers(){
    numbers = '';
    for(let i = 0; i < 3; i++){
        numbers += Math.floor(Math.random() * 100);
        
        return numbers;
    }
    console.log("numbers:" + numbers)
}

function generateEmail(initials){
    let numbers = generateNumbers();
     autoEmail = initials.toLowerCase() + numbers + "@trakd.com";

     console.log("autoEmail:" + autoEmail)
     return autoEmail;
}







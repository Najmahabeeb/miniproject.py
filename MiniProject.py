class Bank_Account:

    def __init__(self):
        self.balance = 0
        print("Hello ,Welcome to ADFG Bank,We are here to help you")

    def deposit(self):
        self.balance += amount
        print(" \n You deposited an amount of ",amount)

    def withdraw(self):
        if self.balance >= amount:
            self.balance -= amount
            print(" \n You withdrew an amount of ",amount)

    def checkbalance(self):
        print("Your net available balance :",self.balance)
    def exit(self):
        print("Thank you ! Visit Again")


while True:
    user_ID =int(input("Enter your Account Number: "))
    password =int(input("Enter your pin : "))
    if user_ID == 45678923 and password == 3579:
        print("login successful")
        break
    else:
        print("Invalid user id or password")

Account = Bank_Account()
while True:
    print("\n select an option: ")
    print("1. Deposit")
    print("2. Withdraw")
    print("3. Check balance")
    print("4. exit")
    option = int(input("Enter your option: "))
    if option == 1:
        amount = float(input("Enter an amount to be deposited: "))
        Account.deposit()
    elif option == 2:
        amount = float(input("Enter an amount to be withdrawn : "))
        Account.withdraw()
    elif option == 3:
        Account.checkbalance()
    elif option == 4:
        Account.exit()
        break
    else:
        print("invalid input! Try Again")



'''def login(self):
        Raj = 485796
        l =int(input("Enter your login id: "))
        if l == Raj:
            print(" \n you logged in successfully")
        else:
            print(" \n incorrect login id")'''



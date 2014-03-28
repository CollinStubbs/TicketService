#!/bin/bash

# make all scripts executable
echo $'\n'
echo "**********RUNNING ALL FRONT END TESTS**********"
echo $'\n'
# make all scripts executable
chmod +x inputs/login_testscripts/*.sh
chmod +x inputs/logout_testscripts/*.sh

# test login test cases
echo "RUNNING login_first_transaction TO GENERATE A SUCCESSFUL LOGIN"
./inputs/login_testscripts/login_first_transaction.sh > ./outputs/actual_login_test_outputs/login_first_transaction.txt
clear
echo "RUNNING login_first_transaction TO GENERATE AN ERROR"
./inputs/login_testscripts/login_first_transaction_error.sh > ./outputs/actual_login_test_outputs/login_first_transaction_error.txt
clear 
echo "RUNNING login_sublogin TO GENERATE AND ERROR IN TRYING TO LOGIN AGAIN"
./inputs/login_testscripts/login_sublogin.sh > ./outputs/actual_login_test_outputs/login_sublogin.txt
clear
echo "RUNNING login_unpriv TO PERFORM PRIVILAGED TRANSACTION ON UNPRIVILAGED USERNAME"
./inputs/login_testscripts/login_unpriv.sh > ./outputs/actual_login_test_outputs/login_unpriv.txt
clear
echo "RUNNING login_priv TO PERFORM PRIVILAGED TRANSACTION ON PRIVILAGED USERNAME"
./inputs/login_testscripts/login_priv.sh > ./outputs/actual_login_test_outputs/login_priv.txt

# Test logout test cases
clear
echo "RUNNING login_valid TO GENERATE ERROR WHEN LOGOUT IS FIRST COMMAND"
./inputs/logout_testscripts/logout_valid.sh > ./outputs/actual_logout_test_outputs/logout_valid.txt
clear
echo "RUNNING login_no_transactions TO TEST THAT NO TRANSACTIONS ARE ACCEPTED AFTER logout"
./inputs/logout_testscripts/logout_no_transactions.sh > ./outputs/actual_logout_test_outputs/logout_no_transactions.txt
clear
echo "RUNNING logout_successful TO TEST THAT WE CAN HAVE A VALID LOGOUT"
./inputs/logout_testscripts/logout_successful.sh > ./outputs/actual_logout_test_outputs/logout_successful.txt

#compare logout 
diff outputs/actual_logout_test_outputs/logout_no_transactions.txt expectedOutputs/expected_logout_test_outputs/logout_no_transactions.txt
diff outputs/actual_logout_test_outputs/logout_valid.txt expectedOutputs/expected_logout_test_outputs/logout_valid.txt
diff outputs/actual_logout_test_outputs/logout_successful.txt expectedOutputs/expected_logout_test_outputs/logout_successful.txt

#compare login
diff outputs/actual_login_test_outputs/login_first_transaction_error.txt expectedOutputs/expected_login_test_outputs/login_first_transaction_error.txt
diff outputs/actual_login_test_outputs/login_first_transaction.txt expectedOutputs/expected_login_test_outputs/login_first_transaction.txt
diff outputs/actual_login_test_outputs/login_priv.txt expectedOutputs/expected_login_test_outputs/login_priv.txt
diff outputs/actual_login_test_outputs/login_unpriv.txt expectedOutputs/expected_login_test_outputs/login_unpriv.txt
diff outputs/actual_login_test_outputs/login_sublogin.txt expectedOutputs/expected_login_test_outputs/login_sublogin.txt



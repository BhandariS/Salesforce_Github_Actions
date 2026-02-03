public class PMD_SoqlInLoop_Demo {

    public static void updateAccountNames() {

        // Fetch some accounts
        List<Account> accList = [
            SELECT Id, Name
            FROM Account
            LIMIT 10
        ];

        // ❌ Intentional PMD violations:
        // 1. SOQL inside loop
        // 2. DML inside loop
        for (Account acc : accList) {

            Account accFromDb = [
                SELECT Id, Name
                FROM Account
                WHERE Id = :acc.Id
                LIMIT 1
            ];

            accFromDb.Name = accFromDb.Name + ' - Updated';
            update accFromDb;
        }
    }
}

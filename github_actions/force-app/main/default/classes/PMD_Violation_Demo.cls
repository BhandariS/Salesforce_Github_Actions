public class PMD_Violation_Demo {

    public static void demoMethod() {

        List<Account> accList = [
            SELECT Id, Name
            FROM Account
            LIMIT 5
        ];

        // ❌ Intentional PMD violations
        for (Account acc : accList) {

            // SOQL inside loop
            Account accFromDb = [
                SELECT Id, Name
                FROM Account
                WHERE Id = :acc.Id
            ];

            // DML inside loop
            accFromDb.Name = accFromDb.Name + ' - PMD';
            update accFromDb;
        }
    }
}

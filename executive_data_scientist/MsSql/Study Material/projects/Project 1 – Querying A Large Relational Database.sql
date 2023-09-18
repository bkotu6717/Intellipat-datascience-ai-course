


-- Perform the following with help of the above database:
    -- https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak

-- a. Get all the details from the person table including email ID, phone number and phone number type
    SELECT 
      P.BusinessEntityID, 
      P.PersonType, 
      P.NameStyle, 
      P.Title,
      P.FirstName,
      P.LastName,
      P.MiddleName,
      P.Suffix,
      PEA.EmailAddress,
      P.EmailPromotion,
      P.AdditionalContactInfo,
      PNP.Name as [PhoneNumberType],
      PP.PhoneNumber,
      P.Demographics
    FROM Person.Person P
    INNER JOIN Person.PersonPhone PP ON P.BusinessEntityID = PP.BusinessEntityID
    INNER JOIN Person.PhoneNumberType PNP ON PNP.PhoneNumberTypeID = PP.PhoneNumberTypeID
    INNER JOIN Person.EmailAddress PEA ON PEA.BusinessEntityID = P.BusinessEntityID

-- b. Get the details of the sales header order made in May 2011
    SELECT * FROM Sales.SalesOrderHeader SOH WHERE YEAR(SOH.OrderDate) = 2011 AND MONTH(SOH.OrderDate) = 5

-- c. Get the details of the sales details order made in the month of May 2011
    SELECT 
      SOH.OrderDate,
      SOD.* 
    FROM Sales.SalesOrderDetail SOD 
    INNER JOIN Sales.SalesOrderHeader SOH ON SOD.SalesOrderID = SOD.SalesOrderID
    WHERE YEAR(SOH.OrderDate) = 2011 AND MONTH(SOH.OrderDate) = 5

-- d. Get the total sales made in May 2011
    SELECT 
        SUM(SOH.TotalDue) AS [Total sales made in May 2011]
    FROM Sales.SalesOrderHeader SOH
    WHERE YEAR(SOH.OrderDate) = 2011 AND MONTH(SOH.OrderDate) = 5

-- e. Get the total sales made in the year 2011 by month order by increasing sales
    SELECT 
      MONTH(SOH.OrderDate) AS [MONTH IN 2011],
      SUM(SOH.TotalDue) AS [TOTAL SALES]
    FROM Sales.SalesOrderHeader SOH
    WHERE YEAR(SOH.OrderDate) = 2011
    GROUP BY MONTH(SOH.OrderDate)
    ORDER BY [TOTAL SALES] ASC

-- f. Get the total sales made to the customer with FirstName='Gustavo' and lastName = 'Achong'
    SELECT 
      COALESCE(SUM(SOH.TotalDue),0) AS [sales made to the customer with FirstName='Gustavo' and lastName = 'Achong']
    FROM Sales.SalesOrderHeader SOH
    INNER JOIN Sales.Customer C ON SOH.CustomerID = C.CustomerID
    INNER JOIN Person.Person P ON C.CustomerID = P.BusinessEntityID
    WHERE P.FirstName = 'Gustavo'
    AND P.LastName = 'Achong'

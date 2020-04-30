-- 1. List the city, state, and zip codes in the customer table.  Your result should 
-- not have duplicates. (Hint: The DISTINCT keyword eliminates duplicates.)

SELECT DISTINCT
    City, State, Aip
FROM
    Customer;

-- 2. List the name, department, phone number, and email address of employees with 
-- a phone number beginning with “3-”.

SELECT 
    EmpName, Department, Phone, Email
FROM
    Employee
WHERE
    Phone LIKE '3%';

-- 3. List all columns of the resource table with a rate between $10 and $20. 
-- Sort the result by rate.

SELECT 
    *
FROM
    ResourceTbl
WHERE
    Rate BETWEEN 10 AND 20
ORDER BY Rate;

-- 4. List the event requests with a status of “Approved” or “Denied” and 
-- an authorized date in July 2018. Include the event number, authorization date, and
--  status in the output. (Hint: see the examples in Module 4 for date constants in 
--  Oracle and MySQL.)

SELECT 
    EvntNo, DateAuth, Status
FROM
    EventRequest
WHERE
    (Status = 'Approved' OR Status = 'Denied')
        AND DateAuth BETWEEN '2013-07-01' AND '2013-07-31';
        
-- 5. List the location number and name of locations that are part of the “Basketball arena”.
-- Your WHERE clause should not have a condition involving the facility number compared 
-- to a constant (“F101”). Instead, you should use a condition on the FacName column for 
-- the value of “Basketball arena”.

SELECT 
    l.locNo, l.locName
FROM
    Location AS l,
    Facility AS f
WHERE
    l.facNo = f.facNo
        AND f.facName = 'Basketball arena';
        
-- 6. For each event plan, list the plan number, count of the event plan lines, and sum 
-- of the number of resources assigned.  For example, plan number “P100” has 4 lines and 7 
-- resources assigned.  You only need to consider event plans that have at least one line.

SELECT 
    ep.PlanNo, COUNT(el.PlanNo), SUM(el.NumberFLD)
FROM
    EventPlan AS ep,
    EventPlanLine AS el
WHERE
    ep.PlanNo = el.PlanNo
GROUP BY ep.PlanNo;



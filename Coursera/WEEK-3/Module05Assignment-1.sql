-- 1. For event requests, list the event number, event date (eventrequest.dateheld), and 
-- count of the event plansInterns.  Only include event requests in the result if the event 
-- request has more than one related event plan with a work date in December 2018.

SELECT 
    er.EvntNo, er.DateHeld, COUNT(*) AS EvntPlanCount
FROM
    EventRequest AS er
        INNER JOIN
    EventPlan AS ep ON er.EvntNo = ep.EvntNo
WHERE
    ep.WorkDate BETWEEN '2018-12-01' AND '2018-12-31'
GROUP BY er.EvntNo
HAVING EvntPlanCount > 1;

-- 2. List the plan number, event number, work date, and activity of event plans meeting 
-- the following two conditions: (1) the work date is in December 2018 and (2) the event is
--  held in the “Basketball arena”.  Your query must not use the facility number (“F101”) of
--  the basketball arena in the WHERE clause. Instead, you should use a condition on the 
--  FacName column for the value of “Basketball arena”.


SELECT 
    ep.PlanNo, ep.EvntNo, ep.WorkDate, ep.Activity
FROM
    EventPlan AS ep
        INNER JOIN
    EventRequest AS er ON ep.EvntNo = er.EvntNo
        INNER JOIN
    Facility AS f ON er.FacNo = f.FacNo
WHERE
    (f.FacName = 'Basketball arena')
        AND (ep.WorkDate BETWEEN '2018-12-01' AND '2018-12-31');
        
3-- . List the event number, event date, status, and estimated cost of events where there 
-- is an event plan managed by Mary Manager and the event is held in the basketball arena 
-- in the period October 1 to December 31, 2018.  Your query must not use the facility 
-- number (“F101”) of the basketball arena or the employee number (“E101”) of “Mary Manager”
-- in the WHERE clause. Thus, the WHERE clause should not have conditions involving the 
-- facility number or employee number compared to constant values.

SELECT
  er.EvntNo,
  er.DateHeld,
  er.dateReq,
  er.estCost,
  er.status
FROM EventRequest AS er
  INNER JOIN EventPlan AS ep ON er.evntNo = ep.evntNo
  INNER JOIN Employee AS e ON ep.empNo = e.empNo
  INNER JOIN Facility AS f ON er.facNo = f.facNo
WHERE (f.facName = 'Basketball arena') AND (er.dateHeld BETWEEN '2018-10-01' AND '2018-12-31') AND
      (e.empName = 'Mary Manager');
      
4. List the plan number, line number, resource name, number of resources 
eventplanline.number), location name, time start, and time end where the event is held 
at the basketball arena, the event plan has activity of activity of “Operation”, and 
the event plan has a work date in the period October 1 to December 31, 2018.  Your query 
must not use the facility number (“F101”) of the basketball arena in the WHERE clause. 
Instead, you should use a condition on the FacName column for the value of 
“Basketball arena”.

SELECT
  epl.PlanNo,
  epl.LineNo,
  epl.NumberFLD AS 'Number',
  epl.TimeStart,
  epl.TimeEnd,
  l.LocName     AS 'Location name',
  r.ResName     AS 'Resource name'
FROM EventPlanLine AS epl
  INNER JOIN EventPlan AS ep ON epl.PlanNo = ep.PlanNo
  INNER JOIN Location AS l ON epl.LocNo = l.LocNo
  INNER JOIN ResourceTbl AS r ON epl.ResNo = r.ResNo
  INNER JOIN Facility AS f ON l.FacNo = f.FacNo
WHERE (f.FacName = 'Basketball arena') AND (ep.Activity = 'Operation') AND
      (ep.WorkDate BETWEEN '2018-10-01' AND '2018-12-31')
ORDER BY epl.PlanNo;


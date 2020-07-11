/*how many packages/mail were sent from this specific city?*/

SELECT DISTINCT fk_costumer, fk_location, fk_zip
FROM deliverys
ORDER BY fk_zip;

/*who sent packages/mail on this date*/

SELECT deliverys.fk_costumer,deliverys.fk_location,costumer_deliveries.deposit,location_deliveries.pick_up
FROM deliverys
INNER JOIN costumer_deliveries ON costumer_deliveries.ID = deliverys.ID
INNER JOIN location_deliveries ON location_deliveries.ID = deliverys.ID
WHERE costumer_deliveries.deposit = '2020-07-11' AND location_deliveries.pick_up = '2020-07-11'
group by deliverys.ID;

/*who sent packages/mail between this and that date*/

SELECT deliverys.fk_costumer,deliverys.fk_location,costumer_deliveries.deposit,location_deliveries.pick_up
FROM deliverys
INNER JOIN costumer_deliveries ON costumer_deliveries.ID = deliverys.ID
INNER JOIN location_deliveries ON location_deliveries.ID = deliverys.ID
WHERE costumer_deliveries.deposit BETWEEN '2020-05-01' AND '2020-07-01' AND location_deliveries.pick_up BETWEEN '2020-05-01' AND '2020-07-01'
group by deliverys.ID;
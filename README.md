# week13_view

Which commands caused errors, and why?
setting a value on a row with the word 'insouciant' caused the error since you cant change values in a view that is read only.

Why are DML operations restricted in some views?
DML operations change data, in this case, it will change values in the view. It is restricted if the view is read only, disabling any changes.

How is a materialized view different from a regular view?
Materialized views replicates data and physically storing the results while regular view does not.

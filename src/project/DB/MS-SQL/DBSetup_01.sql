-- DATE Ÿ������ �����ؼ� hh:mm:ss ������
ALTER TABLE tbBaseInterestRate
ALTER COLUMN date DATE

-- base_interest_rate �÷��� ���� �� type ����
EXEC sp_rename 'tbBaseInterestRate.[base_interest_rate]', 'BaseInterestRate', 'COLUMN'

ALTER TABLE tbBaseInterestRate
ALTER COLUMN BaseInterestRate varchar(5)

-- tbAPTPrice �÷��� ����
EXEC sp_rename 'tbAPTPrice.[���Ǳݾ�(����)]', '���Ǳݾ�_����', 'COLUMN'
EXEC sp_rename 'tbAPTPrice.[�ǹ�����(��)]', '�ǹ�����_m2', 'COLUMN'
EXEC sp_rename 'tbAPTPrice.[��������(��)]', '��������_m2', 'COLUMN'
EXEC sp_rename 'tbAPTPrice.[�Ű��� ���������߰��� �ñ�����]', '�Ű�_�����߰���_����', 'COLUMN'

-- tbAPTPrice �÷� type ����
ALTER TABLE tbAPTPrice ALTER COLUMN �������� CHAR(4) -- 4�ڸ� ����
ALTER TABLE tbAPTPrice ALTER COLUMN ��ġ���ڵ� VARCHAR(10) -- 5�ڸ��� �ִ��ε� Ȥ�� �𸣴� �����ְ�
ALTER TABLE tbAPTPrice ALTER COLUMN ��ġ���� NVARCHAR(MAX)
ALTER TABLE tbAPTPrice ALTER COLUMN �������ڵ� VARCHAR(10) -- 5�ڸ��� �ִ��ε� Ȥ�� �𸣴� �����ְ�
ALTER TABLE tbAPTPrice ALTER COLUMN �������� NVARCHAR(MAX)
ALTER TABLE tbAPTPrice ALTER COLUMN �������� VARCHAR(5)
ALTER TABLE tbAPTPrice ALTER COLUMN �������и� VARCHAR(5)
ALTER TABLE tbAPTPrice ALTER COLUMN ���� VARCHAR(10) -- 4�ڸ��� �ִ��ε� Ȥ�� �𸣴� �����ְ�
ALTER TABLE tbAPTPrice ALTER COLUMN �ι� VARCHAR(10) -- 4�ڸ��� �ִ��ε� Ȥ�� �𸣴� �����ְ�
ALTER TABLE tbAPTPrice ALTER COLUMN �ǹ��� VARCHAR(MAX)
ALTER TABLE tbAPTPrice ALTER COLUMN ���Ǳݾ�_���� VARCHAR(2000)
ALTER TABLE tbAPTPrice ALTER COLUMN �ǹ�����_m2 VARCHAR(2000)
ALTER TABLE tbAPTPrice ALTER COLUMN �� VARCHAR(10)
ALTER TABLE tbAPTPrice ALTER COLUMN �Ǹ����� VARCHAR(MAX)
ALTER TABLE tbAPTPrice ALTER COLUMN ����� DATE
ALTER TABLE tbAPTPrice ALTER COLUMN ����⵵ CHAR(4) -- 4�ڸ� ����
ALTER TABLE tbAPTPrice ALTER COLUMN �ǹ��뵵 VARCHAR(2000)
ALTER TABLE tbAPTPrice ALTER COLUMN �Ű��� VARCHAR(2000)
ALTER TABLE tbAPTPrice ALTER COLUMN �Ű�_�����߰���_���� VARCHAR(2000)

-- Ư�� �÷� ���۾�
ALTER TABLE tbAPTPrice ADD �����_DATE DATE

-- BIGINT �ٳ���� �Ҽ��� ���ŵȴٰ� ��
UPDATE tbAPTPrice
set �����_DATE = CAST(CONVERT(VARCHAR(20), CAST(����� AS BIGINT)) AS DATE)

-- Ȯ��
SELECT top 10 ����� FROM tbAPTPrice

-- ���� �÷� ������
ALTER TABLE tbAPTPrice DROP COLUMN �����









-- DATE 타입으로 수정해서 hh:mm:ss 날리기
ALTER TABLE tbBaseInterestRate
ALTER COLUMN date DATE

-- base_interest_rate 컬럼명 수정 및 type 수정
EXEC sp_rename 'tbBaseInterestRate.[base_interest_rate]', 'BaseInterestRate', 'COLUMN'

ALTER TABLE tbBaseInterestRate
ALTER COLUMN BaseInterestRate varchar(5)

-- tbAPTPrice 컬럼명 수정
EXEC sp_rename 'tbAPTPrice.[물건금액(만원)]', '물건금액_만원', 'COLUMN'
EXEC sp_rename 'tbAPTPrice.[건물면적(㎡)]', '건물면적_m2', 'COLUMN'
EXEC sp_rename 'tbAPTPrice.[토지면적(㎡)]', '토지면적_m2', 'COLUMN'
EXEC sp_rename 'tbAPTPrice.[신고한 개업공인중개사 시군구명]', '신고_공인중개사_지역', 'COLUMN'

-- tbAPTPrice 컬럼 type 수정
ALTER TABLE tbAPTPrice ALTER COLUMN 접수연도 CHAR(4) -- 4자리 연도
ALTER TABLE tbAPTPrice ALTER COLUMN 자치구코드 VARCHAR(10) -- 5자리가 최대인데 혹시 모르니 여유있게
ALTER TABLE tbAPTPrice ALTER COLUMN 자치구명 NVARCHAR(MAX)
ALTER TABLE tbAPTPrice ALTER COLUMN 법정동코드 VARCHAR(10) -- 5자리가 최대인데 혹시 모르니 여유있게
ALTER TABLE tbAPTPrice ALTER COLUMN 법정동명 NVARCHAR(MAX)
ALTER TABLE tbAPTPrice ALTER COLUMN 지번구분 VARCHAR(5)
ALTER TABLE tbAPTPrice ALTER COLUMN 지번구분명 VARCHAR(5)
ALTER TABLE tbAPTPrice ALTER COLUMN 본번 VARCHAR(10) -- 4자리가 최대인데 혹시 모르니 여유있게
ALTER TABLE tbAPTPrice ALTER COLUMN 부번 VARCHAR(10) -- 4자리가 최대인데 혹시 모르니 여유있게
ALTER TABLE tbAPTPrice ALTER COLUMN 건물명 VARCHAR(MAX)
ALTER TABLE tbAPTPrice ALTER COLUMN 물건금액_만원 VARCHAR(2000)
ALTER TABLE tbAPTPrice ALTER COLUMN 건물면적_m2 VARCHAR(2000)
ALTER TABLE tbAPTPrice ALTER COLUMN 층 VARCHAR(10)
ALTER TABLE tbAPTPrice ALTER COLUMN 권리구분 VARCHAR(MAX)
ALTER TABLE tbAPTPrice ALTER COLUMN 취소일 DATE
ALTER TABLE tbAPTPrice ALTER COLUMN 건축년도 CHAR(4) -- 4자리 연도
ALTER TABLE tbAPTPrice ALTER COLUMN 건물용도 VARCHAR(2000)
ALTER TABLE tbAPTPrice ALTER COLUMN 신고구분 VARCHAR(2000)
ALTER TABLE tbAPTPrice ALTER COLUMN 신고_공인중개사_지역 VARCHAR(2000)

-- 특정 컬럼 재작업
ALTER TABLE tbAPTPrice ADD 계약일_DATE DATE

-- BIGINT 다녀오면 소수점 제거된다고 함
UPDATE tbAPTPrice
set 계약일_DATE = CAST(CONVERT(VARCHAR(20), CAST(계약일 AS BIGINT)) AS DATE)

-- 확인
SELECT top 10 계약일 FROM tbAPTPrice

-- 기존 컬럼 날리기
ALTER TABLE tbAPTPrice DROP COLUMN 계약일









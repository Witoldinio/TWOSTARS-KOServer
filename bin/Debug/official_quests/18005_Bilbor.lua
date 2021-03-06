
-- [관리인] 빌보르
-- 그냥 닫기 101

-- EVENT 는 100번 이상 부터 사용하라

-- UID : 서버에서 제공하는 유저번호
-- EVENT : 서버에서 제공하는 퀘스트 번호
-- STEP : 서버에서 제공하는 퀘스트 내부 단계

-- 위의 세가지 파라메타는 루아 실행시 항상 전역변수로 제공�

-- 지역변수 선언...
local UserClass;
local QuestNum;
local Ret = 0;
local NPC=18005; --NPC 번호 
local savenum = -1;

-- [관리인] 빌보르 클릭시 퀘스트 체크  

if EVENT == 100 then
    SelectMsg(UID, 3, -1, 101, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

--4257, 800

if EVENT == 101 then -- 그냥 닫기 
    Ret = 1;
end

--******************************************************--
-- 접속자 이벤트 시작
--******************************************************--
if EVENT == 800 then
    SelectMsg(UID, 2, savenum, 4805, NPC, 4259, 801, 4063, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

if EVENT == 801 then
   SelectMsg(UID, 2, savenum, 4811, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

--if EVENT == 801 then
--   CheckLogTimeAccount(UID, 802, 803) -- 상품을 받았나 안받았나? 성공시 1
--end

--if EVENT == 802 then
--    SelectMsg(UID, 2, savenum, 4806, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
--end

--if EVENT == 803 then
--    Slot = CheckGiveSlot(UID) 
--        if Slot > 2 then
--        GiveLogTimeItem(UID)
--        SelectMsg(UID, 2, savenum, 4808, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
--        else
--        SelectMsg(UID, 2, savenum, 4807, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
--        end
--end


--******************************************************--
-- 접속자 이벤트 끝 
--******************************************************--

-----------------------------------------------------------
-- 선물 상자 시작
-----------------------------------------------------------

   local ItemA = 0;
   local RUN_EXCHANGE ;

if EVENT == 400 then
    SelectMsg(UID, 2, savenum, 4809, NPC, 4260, 401, 4261, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

   local Roll = 0;
   local found;


if EVENT == 401 then
	ItemA = HowmuchItem(UID, 379132000);  -- 선물 상자
	if  ItemA < 1 then 
	SelectMsg(UID, 2, savenum, 4810, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
	else
    Check = CheckExchange(UID, 1060)
        if  Check ==1 then   
        Roll = RollDice(UID, 20) 
        found = Roll + 1059
        RunExchange(UID, found)		     
        SelectMsg(UID, 2, savenum, 4808, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        else
        Ret = 1; 
        end  
	end
end


-----------------------------------------------------------
--선물 상자 끝 
-----------------------------------------------------------

-----------------------------------------------------------
-- 감찰단 system
-----------------------------------------------------------

if EVENT == 500 then
    SelectMsg(UID, 10, savenum, 4808, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end

-----------------------------------------------------------
--감찰단 system 끝 
-----------------------------------------------------------


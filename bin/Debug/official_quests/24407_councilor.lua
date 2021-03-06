
-- [고문관]헤르가
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
local NPC= 24407; --NPC 번호 


-- [고문관]헤르가 퀘스트 체크  

if EVENT == 100 then
	QuestNum = SearchQuest(UID, NPC);
		if QuestNum == 0 then --해당 NPC에게 할수 있는 퀘스트가 0개 일때 
			 SelectMsg(UID, 2, -1, 4173, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
			 Ret = 1; 
		elseif QuestNum > 1 and QuestNum < 100 then--해당 NPC에게 할수 있는 퀘스트가 1개 일때 
          NpcMsg(UID, 4174, NPC)
      else--해당 NPC에게 할수 있는 퀘스트가 1개 이상 일때 
          EVENT = QuestNum
		end
end

if EVENT == 101 then -- 그냥 닫기 
    Ret = 1;
end


-----------------------------------------------------------
-- 다크루나 시작 

local savenum = 63;
local Level
local NATION
-----------------------------------------------------------

if EVENT == 103 then
Level = CheckLevel(UID)
    if Level > 29 and Level < 50 then -- 30~50사이 
    NATION = CheckNation(UID);
        if NATION == 1 then -- 카루스 일때
        SaveEvent(UID,4160);
        SelectMsg(UID, 1, savenum, 4175, NPC, 4080, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        else -- 엘모일때
        SaveEvent(UID,4172);
        SelectMsg(UID, 1, savenum, 4176, NPC, 4080, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        end
    else
     Ret = 1;
    end
end

-- [고문관]헤르가  63번의 속성 0번 4번일 경우

if EVENT == 105 then
Level = CheckLevel(UID)
    if Level > 29 and Level < 50 then -- 30~50사이 
    SelectMsg(UID, 4, savenum, 4177, NPC, 22, 106, 23, 107, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    elseif Level > 50 then
    SelectMsg(UID, 2, savenum, 4178, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    SaveEvent(UID, 4162);
    else
    SelectMsg(UID, 2, savenum, 4178, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 106 then
    SaveEvent(UID,4161);
end

if EVENT == 107 then
    SaveEvent(UID,4164);
end

--[고문관]헤르가  63번의 속성 1번 3번일 경우

   local ItemA = 0;


if EVENT == 110 then 
    SelectMsg(UID, 2, savenum, 4180, NPC, 4171, 120, 4063, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 120 then 
    ItemA = HowmuchItem(UID, 910084000);  
   if ItemA == 0 then 
       SelectMsg(UID, 2, savenum, 4179, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
    SaveEvent(UID, 4162);
    RunExchange(UID, 468);
   end
end
-----------------------------------------------------------
-- 다크루나 끝 
-----------------------------------------------------------

-----------------------------------------------------------
-- 루나 시작 
local savenum = 64;
local Level
local NATION
-----------------------------------------------------------


if EVENT == 123 then
Level = CheckLevel(UID)
    if Level > 39 then -- 40 이상일때 
    NATION = CheckNation(UID);
        if NATION == 1 then -- 카루스 일때
        SaveEvent(UID,4166);
        SelectMsg(UID, 1, savenum, 4181, NPC, 4080, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        else -- 엘모일때
        SaveEvent(UID,4177);
        SelectMsg(UID, 1, savenum, 4182, NPC, 4080, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
        end
    else
     Ret = 1;
    end
end

-- [고문관]헤르가  64번의 속성 0번 4번일 경우

if EVENT == 125 then
Level = CheckLevel(UID)
    if Level > 39 then -- 40 이상일때 
    SelectMsg(UID, 4, savenum, 4183, NPC, 22, 126, 23, 127, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    else
    SelectMsg(UID, 2, savenum, 4184, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
    end
end

if EVENT == 126 then
    SaveEvent(UID,4167);
end

if EVENT == 127 then
    SaveEvent(UID,4170);
end

--[고문관]헤르가  64번의 속성 1번 3번일 경우

   local ItemA = 0;


if EVENT == 130 then 
    SelectMsg(UID, 2, savenum, 4185, NPC, 4171, 131, 4063, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
end


if EVENT == 131 then 
    ItemA = HowmuchItem(UID, 910085000);  
   if  ItemA == 0 then 
       SelectMsg(UID, 2, savenum, 4186, NPC, 10, 101, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
   else
    SaveEvent(UID, 4168);
    RunExchange(UID, 469);
   end
end

-----------------------------------------------------------
-- 루나 끝 
-----------------------------------------------------------

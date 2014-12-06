-- ------------------------------------------------------------------------------ --
--                            TradeSkillMaster_Mailing                            --
--            http://www.curse.com/addons/wow/tradeskillmaster_mailing            --
--                                                                                --
--             A TradeSkillMaster Addon (http://tradeskillmaster.com)             --
--    All Rights Reserved* - Detailed license information included with addon.    --
-- ------------------------------------------------------------------------------ --

-- TradeSkillMaster_Mailing Locale - zhTW
-- Please use the localization app on CurseForge to update this
-- http://wow.curseforge.com/addons/tradeskillmaster_mailing/localization/

local L = LibStub("AceLocale-3.0"):NewLocale("TradeSkillMaster_Mailing", "zhTW")
if not L then return end

L[ [=[Automatically rechecks mail every 60 seconds when you have too much mail.

If you loot all mail with this enabled, it will wait and recheck then keep auto looting.]=] ] = [=[當你有過多郵件時,將每60秒複查郵件.

當開啟此項時若你正在拾取全部郵件,程式將等待並複查郵件但保持自動拾取。]=]
L["Auto Recheck Mail"] = "自動重新檢查郵件"
L["BE SURE TO SPELL THE NAME CORRECTLY!"] = "請務必保證收件人姓名拼寫的正確性！"
L["Buy: %s (%d) | %s | %s"] = "購買: %s (%d) | %s | %s"
L["Cannot finish auto looting, inventory is full or too many unique items."] = "無法完成自動拾取郵件,行囊已滿或者擁有過多唯一物品."
L["Chat Message Options"] = "聊天框消息选项"
L["Clear"] = "清除"
L["Clears the item box."] = "清除項目列表"
L["Click this button to send all disenchantable greens in your bags to the specified character."] = "點擊此按鈕將您背包中所有能分解的綠裝發送給指定角色。"
L["Click this button to send excess gold to the specified character."] = "點擊此按鈕將發送超額的金幣給指定的角色。"
L["Click this button to send off the item to the specified character."] = "點擊此按鈕將物品郵寄給指定角色。"
L["COD Amount (per Item):"] = "貨到付款金額（每件）："
L["COD: %s | %s | %s | %s"] = "貨到付款: %s | %s | %s | %s"
L["Collected COD of %s from %s for %s."] = "收取付費郵件 %s 從 %s 處 ( 給%s )。"
L["Collected expired auction of %s"] = "收取過期拍賣品 %s"
L["Collected mail from %s with a subject of '%s'."] = "收取 %s 郵件 ( 主題: '%s' )。"
L["Collected purchase of %s (%d) for %s."] = "收取購買的 %s (%d), →給 %s。"
L["Collected sale of %s (%d) for %s."] = "收取出售的 %s (%d), →給 %s。"
L["Collected %s and %s from %s."] = "收取 %s 和 %s ( 从 %s )。"
L["Collected %s from %s."] = "收取 %s ( 从 %s )。"
L["Collect Gold"] = "拾取金幣"
L["Could not loot item from mail because your bags are full."] = "由於你的背包已滿，無法再收取郵件。"
L["Could not send mail due to not having free bag space available to split a stack of items."] = "由於你的背包沒有拆開堆疊的空間，無法發送出郵件。"
L["Display Total Money Received"] = "顯示收取金幣總額"
L["Drag (or place) the item that you want to send into this editbox."] = "將你想要郵寄物品拖進編輯框。"
L["Enable Inbox Chat Messages"] = "開啟對話框收件信息"
L["Enable Sending Chat Messages"] = "開啟對話框發件信息"
L["Enter name of the character disenchantable greens should be sent to."] = "輸入收取綠裝的收件人姓名。"
L["Enter the desired COD amount (per item) to send this item with. Setting this to '0c' will result in no COD being set."] = "輸入你希望的該物品郵寄時收取的費用（單件）。設置為‘0c’將不會收取費用。"
L["Enter the name of the player you want to send excess gold to."] = "輸入收取額外金幣的收件人姓名。"
L["Enter the name of the player you want to send this item to."] = "輸入收取這個件物品的收件人姓名。"
L["Error creating operation. Operation with name '%s' already exists."] = "操作創建錯誤。操作名 '%s' 已經存在"
L["Expired: %s | %s"] = "過期的: %s | %s"
L["General"] = "綜述"
L["General Settings"] = "常規設置"
L["Give the new operation a name. A descriptive name will help you find this operation later."] = "給新操作命名，一個描述性的命名會幫助您在以後更容易找到它。"
L["If checked, a maxium quantity to send to the target can be set. Otherwise, Mailing will send as many as it can."] = "如果勾選此項，可以設置發送給目標的最大數量。否則，將會盡可能的發送（無限制發送）。"
L["If checked, information on mails collected by TSM_Mailing will be printed out to chat."] = "如果勾選此項，通過TSM_Mailing收取的郵件信息將會在聊天框裡顯示。"
L["If checked, information on mails sent by TSM_Mailing will be printed out to chat."] = "如果勾選此項，通過TSM_Mailing發送的郵件信息將會在聊天框裡顯示。"
L["If checked, the Mailing tab of the mailbox will be the default tab."] = "如果勾選此項，郵寄標籤的將被設定為郵箱的默認標籤。"
L["If checked, the 'Open All' button will leave any mail containing gold."] = "如果勾選此項，按鈕“全部打開”將不再會收取含有金幣的郵件。"
L["If checked, the target's current inventory will be taken into account when determing how many to send. For example, if the max quantity is set to 10, and the target already has 3, Mailing will send at most 7 items."] = "如果勾選此項，當決定發送多少時，收件人當前的庫存將被考慮進來。例如，如果最大的數量設置為10件，目標已經有3件，郵件將發送最多7件。"
L["If checked, the target's guild bank will be included in their inventory for the 'Restock Target to Max Quantity' option."] = "如果勾選此項，‘對目標最大量補貨’時會包括其工會銀行庫存。"
L["If checked, the total amount of gold received will be shown at the end of automatically collecting mail."] = "如果勾選此項，收取的金幣總數會顯示在自動收件的最後。"
L["Inbox"] = "收件箱"
L["Include Guild Bank in Restock"] = "補充庫存里包括工會銀行"
L["Item (Drag Into Box):"] = "物品（拖進列表）："
L["Keep Quantity"] = "保持數量"
L["Leave Gold with Open All"] = "全部打開（不取金幣）"
L["Limit (In Gold):"] = "限制（金）："
L["Mail Disenchantables:"] = "郵寄分解綠裝："
L["Mailing all to %s."] = "全部郵寄至 %s。"
L["Mailing operations contain settings for easy mailing of items to other characters."] = "Mailing操作的設置郵寄使郵寄更加便捷。"
L["Mailing up to %d to %s."] = "郵寄了 %d 給 %s。"
L["Mailing will keep this number of items in the current player's bags and not mail them to the target."] = "這是該物品的背包內最低保有量, 保有的物品不會被郵寄出去。"
L["Mail Selected Groups"] = "郵寄選定分組"
L["Mail Send Delay"] = "郵寄時間間隔"
L["Make Mailing Default Mail Tab"] = "將Mailing設置為默認標籤"
L["Maxium Quantity"] = "最大數量"
L["Max Quantity:"] = "最大數量:"
L["Multiple Items"] = "多件物品"
L["New Operation"] = "新操作"
L["Next inbox update in %d seconds."] = "郵箱在 %d 秒後刷新。"
L["No Item Specified"] = "没有指定物品"
L["No Quantity Specified"] = "沒有指定數量"
L["No Target Player"] = "沒有目標角色"
L["No Target Specified"] = "無指定目標"
L["Not sending any gold as you have less than the specified limit."] = "沒有郵寄金幣,因為您的金幣數量低於最低設定值。"
L["Not Target Specified"] = "沒有指定目標"
L["Open All"] = "全部打開"
L["Operation Name"] = "操作名"
L["Operations"] = "操作"
L["Operation Settings"] = "操作設置"
L["Options"] = "選項"
L["Other"] = "其他"
L["Quick Send"] = "快速發送"
L["Relationships"] = "關聯"
L["Reload UI"] = "重載介面"
L["Restart Delay (minutes)"] = "自動郵件重啟延遲（分鐘）"
L["Restock Target to Max Quantity"] = "對目標最大數量補貨"
L["Sale: %s (%d) | %s | %s"] = "出售: %s (%d) | %s | %s"
L["Send Disenchantable Greens to %s"] = "郵寄分解綠裝給 %s"
L["Send Excess Gold to Banker:"] = "郵寄超額金幣給金庫角色:"
L["Send Excess Gold to %s"] = "郵寄超額金幣給 %s"
L["Sending..."] = "發送中..."
L["Send Items Individually"] = "單獨郵寄物品"
L["Sends each unique item in a seperate mail."] = "使用單獨的郵件發送每個唯一物品"
L["Send %sx%d to %s - No COD"] = "郵寄 %sx%d 給 %s - 不收費"
L["Send %sx%d to %s - %s per Item COD"] = "郵寄 %sx%d 給 %s - 單件收費 %s"
L["Sent all disenchantable greens to %s."] = "郵寄全部分解綠件給 %s。"
L["Sent %s to %s."] = "郵寄 %s 至 %s."
L["Sent %s to %s with a COD of %s."] = "郵寄 %s 給 %s 附帶收費 %s。"
L["Set Max Quantity"] = "設置最大數量"
L["Sets the maximum quantity of each unique item to send to the target at a time."] = "設置單次郵寄的每種物品的最大郵寄量。"
L["Shift-Click to automatically re-send after the amount of time specified in the TSM_Mailing options."] = "Shift+右鍵點擊 自動重發(在TSM_Mailing選項裏設定的指定時間後)。"
L["Showing all %d mail."] = "顯示所有%d郵件。"
L["Showing %d of %d mail."] = "顯示 %d of %d 郵件。"
L["Skipping operation '%s' because there is no target."] = "由於沒有目標,跳過操作 '%s' 。"
L["%s to collect."] = "%s 收取"
L["%s total gold collected!"] = "%s 金幣收取總數！"
L["Target:"] = "收件人："
L["Target is Current Player"] = "收件人是當前玩家"
L["Target Player"] = "收件人"
L["Target Player:"] = "收件人："
L["The name of the player you want to mail items to."] = "您所希望的收件角色的姓名。"
L["This is maximum amount of gold you want to keep on the current player. Any amount over this limit will be send to the specified character."] = "這是您希望的當前角色金幣最大持有量。多餘的金幣會被郵寄到指定角色(金庫角色)。"
L["This is the maximum number of the specified item to send when you click the button below."] = "這是當您點擊下麵的按鈕時郵寄指定物品的最大郵寄量。"
L["This slider controls how long the mail sending code waits between consecutive mails. If this is set too low, you will run into internal mailbox errors."] = "此滑動條控制著連續發送郵件的間隔時間。若設置數值太低，會出現內部郵箱錯誤。"
L["This tab allows you to quickly send any quantity of an item to another character. You can also specify a COD to set on the mail (per item)."] = "此標籤允許您快速發送任何數量的物品給另一個角色。您也可以通過設置發送收費郵件(單件計費)。"
L["TSM Groups"] = "TSM分組"
L["TSM_Mailing Excess Gold"] = "TSM_Mailing 超額金幣"
L["When you shift-click a send mail button, after the initial send, it will check for new items to send at this interval."] = "當你shift+左鍵點擊發送按鈕, 初次郵寄後，將在設置的分鐘數後檢查新專案。"

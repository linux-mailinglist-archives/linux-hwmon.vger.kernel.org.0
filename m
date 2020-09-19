Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE36270B5F
	for <lists+linux-hwmon@lfdr.de>; Sat, 19 Sep 2020 09:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgISHQd (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 19 Sep 2020 03:16:33 -0400
Received: from sonic304-56.consmr.mail.bf2.yahoo.com ([74.6.128.31]:34237 "EHLO
        sonic304-56.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726054AbgISHQc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Sep 2020 03:16:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1600499791; bh=mVP+6YCgZnTVHsGkrP9kwmYvHedj6Sabwr40ntoo3gI=; h=Date:From:Reply-To:Subject:References:From:Subject; b=SQ2NITwmLTey7Q3y/gYOJ80R/WKvpuQckMSLxElxvOptlg2Jp3zx9YQj4sTipeCDCffHjEulkyCsr/SMMcCbp21m7sFWp68WW5OBA1tmf+U8/zidQ/s0+sD5ofxMbsn6LiSySWd//i9rX0HFNes/4GidWjdZ++/sJmxvomcpa/4PBNn5uDzuBeO5QuCc7qt6oMLAz+upYscSdexQ4vFKkTliYfWJpFPy3PrU3iEgPCVouPnl8BXCV1+3NEbZvQwYg4PlZP9s5GnVt5pEC10GPiXNxz2lXtGA1XuKhyj/oZvvYpRBKAUSAM8SzddJhjMAqv3gYcpbsI2w8XD+ZDdppw==
X-YMail-OSG: qrsvY28VM1nn53eqP3877mKgoNFnNLmc1c3CiNqsgpkQ6TMt4suv_MXbwFQJ3t2
 G4CvDxNIfm8f19njHbbvprK9cC8OR8THHAH7UR3HNF7CCmmBYYRMI_zli5SuBugFwyzmpHMXguMq
 QFbBwmadQ4GkiOf_pDVffkXDvV07kfuOR5pPRHIa1cH.xkcHY2GHIYAWH.GSA8.VZuNoToeg.8U2
 x49DU5zanfwc5cfCk1D90lKrj6Y.XS23ODsY8dsFSK14snzbMnYgO2YbR6LnQRVhcxbzuCiJyamf
 e7SJKBmkgBRZkYvNq7fNCPTg8F_DuLHCCH7hedVnhsZi.NwY8hx.99B6nZzp4tMqmvkP5bOY5JTL
 D9dMUxDZgx0HPSlp87ALNb9kGPfU4XZdgM_oQxQypl0z1qGI1W6epy9PFHw0ztOprvNb0TjT7WzX
 xzyEtw4WOW75Q.8GELDMb5RFlw5NwoQt6hXv7McH_C10whZAj0yrxZ0jhBsZ4kCz1_sp.JZ_EsrR
 69NaNWlvloNPSzKVSkiQz49PXDB6BO8IT5UzyQP5chze_aQRldUrJG52NK.OO2IGRdF5JhppaeNy
 uol6kfXb_AgsfLedv4xH6QFPxCqZmWI0a3qhuzkccISNh.aB4q3xtaYjbRfDNgWs8ITygLWQ5MMR
 w.VioQHlm3tEUNuiUgRdLvvZjM3YUxl0djRVnaSYDREme1dGVabNUjYStQG4cxmclogUenYWaTkq
 jUD1L8.iLwJboCRPK1BlF3UIN1CDq91JCidFrQlWdM4Gj0bw5u3osbvD7HrWkuXfRX_n8ye_kqIL
 Han2nJQyLk0DAEoSPjDO1WskOoz6vsNHszDsW8X8N8EwZRPMsdlP4XQ4h2qUkTod8rEG4iwajZUX
 SLPijlYOLLaXJn3BTOk5IOHfnu.ENzaKftMjB_agRwGDfZsPFquydxUsonQS5z1xY_Q4BdKKpGxo
 FcYJrgTrnr1yGcHn3.ypysIZJ2KQBBIR3Qdy7vXnCZpcoLrBcmHtjErH6CA5Z_8T5vpmMffuf5kx
 KIz9juuE1k2LHnHEz0W8BLnAB4_EzBsUbKdg_BL6P715pkFZc_eexiA71gNtCtD9rXsKZMHv.Xpi
 xCjwluIf5w_4hvXnwUj9aLCPjCzapgz3AjhPkUXiqiWo4I1IkSE7ak3612NLVGjWod19mNzavfwr
 cEEF8osamT1iukGwcFGzHw.2YNzOmQrvX0cIBrAKYxa9.M1Pf3vrMCN9v9qEx0Zqcvz0GbG2aRba
 n3fxvHhaS5_uXlRmqOwTniLkTCww6FzYWNZCQry4lNd7nMk1ASONBR746YBYqWru1YeWbHMUo_C2
 RMzsn5nSbPf7pCxCPZ.pfMc2yqR_ObVCXPyFOvDQuatnTk25X2U43lG1UwhHgDoMMmQe2KdEN3Cn
 bkPChaL8T5RdaU7aRktzZnr5dNmv79CnwqOMuiKw5Yg867X58C0YUWB3kxNy0IUr8tBo2iRkKgOT
 2gRQpLQ--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.bf2.yahoo.com with HTTP; Sat, 19 Sep 2020 07:16:31 +0000
Date:   Sat, 19 Sep 2020 07:16:26 +0000 (UTC)
From:   Miss Vina Omran Hussain <vinaomran953@gmail.com>
Reply-To: miss.vina24@gmail.com
Message-ID: <877539764.3840268.1600499786823@mail.yahoo.com>
Subject: Dearest,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <877539764.3840268.1600499786823.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16583 YMailNodin Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:80.0) Gecko/20100101 Firefox/80.0
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



Dearest,

Good day and how are you doing today. I'm really delighted to communicate w=
ith you and I believe we can achieve everything together and create somethi=
ng great in nearest future. My name is Ms. Vina Omran Hussain Ibrahim and I=
'm a young girl of 24 year old from Kobani a city in the Aleppo Governorate=
 in Northern Syria and presently, I'm residing in the Republic of Burkina F=
aso as a refugee due to killing of my parents by the ISIS fighters on the y=
ear 2015 popularly know as "Kobani Massacre" that was carried out by the Da=
esh/ISIS fighters. Please don't be discouraged for hearing this. I believe =
deep down inside me that you will never break my heart or let me down in an=
yway.

My beloved father(Mr.Omran Hussain Ibrahim ) was the Mayor of the city of K=
obani and also the Head of Aleppo Investment Authority. The brutal killing =
of my father took place one early morning by the Daesh/ISIS fighters as a r=
esult of the ongoing civil war in Syria. I was in my first year in the Univ=
ersity of Aleppo studying Arts and Humanities before the sad incident and t=
hat led to the death of my beloved father. Darling, I know that it is too e=
arly to disclose my life story to you but please bear with me. My living co=
ndition is very critical, please I need your possible help to reclaim my in=
heritance and start a new life. My uncle have sought to kill me so that he =
will have full control of my father's estate but I am happy that all his ev=
il failed.

Meanwhile, I decided to travel abroad in order to secure my future but the =
problem is that since I don't have an international passport, I cannot be a=
llowed to enter any Country freely and legally. However, the only choice fo=
r me was to enter Turkey, because it is not far from Kobani and many people=
 are crossing to Turkey so I joined them and crossed over to Turkey. It was=
 in my presence that the Turkish soldiers gunned down Kader Ortakaya a famo=
us woman activist at the Turkey and Syria border. A lot happened during thi=
s conflict, it was awful, I only thank God that I'm alive today.

I arrived to Burkina Faso through the help of International Red Cross and R=
ed Crescent Movement, they were moving people away from the Turkish border =
because of the insecurity of the border, so they moved some people to Canad=
a, some to Germany and Italy and few to Morocco and Burkina Faso. I decided=
 to come to Burkina Faso, because when my beloved father was alive, he reve=
aled to me about the sum of $27.5 Million which he deposited in one of the =
Banks in Burkina Faso with my name as his next of kin. On my arrival to Oua=
gadougou, where the Bank is located, I contacted them to clear the money, b=
ut the Branch operation Manager who confirmed the deposited amount of money=
 told me that my status as a refugee according to the Laws of Burkina Faso =
does not permit me to engage in any Bank transaction. He advised me to nomi=
nate a trustee who will stand on my behalf and carry out the operation. Thi=
s has become necessary after I have been denied the right to own a Bank acc=
ount or perform other forms of financial transaction here because I am a po=
litical asylum seeker. So, I decided to get in touch with you so that you w=
ill help me with the transfer of this money into your Bank account for inve=
stment in your Country. After you have received the money in your Bank acco=
unt, you will send me some amount of money to process my traveling papers b=
ecause I want to relocate to your Country where I will start a new life wit=
h you. And I intend to complete my academic studies in your Country. I acce=
pt to share my life with you and give you all my attention from day one of =
the meetings.

Immediately you confirm your interest to help me, then I will give you more=
 details as to how we shall conclude this transaction. Please do let me kno=
w if you are interested in helping me with the transfer of the money into y=
our bank account for possible investment in your Country so that I will sen=
d you more details on how you will stand as my trustee and finalize the tra=
nsaction with the Bank where my dad deposited the money. I beg you please t=
o keep this as a top secret between us for confidential reasons. At the mom=
ent I am living in the Mission House. Life in this place is very unbearable=
 because we are not allowed to go out and we are monitored by the Church se=
curity guard. Please help me because I want to leave this place quickly to =
live my normal with you.Please all communications should be through this em=
ail address for confidential purposes ( miss.vina24@gmail.com ).

I look forward to hearing from you soon.

Yours truly
Ms.Vina Omran Hussain Ibrahim .
miss.vina24@gmail.com

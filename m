Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B672916C7
	for <lists+linux-hwmon@lfdr.de>; Sun, 18 Oct 2020 11:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgJRJp1 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 18 Oct 2020 05:45:27 -0400
Received: from sonic316-13.consmr.mail.bf2.yahoo.com ([74.6.130.123]:40139
        "EHLO sonic316-13.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725320AbgJRJp0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 18 Oct 2020 05:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1603014325; bh=mZFdy6s88lY1OfVHZCNBCNs7w/HtpGg9ZKvG/5VhQN8=; h=Date:From:Reply-To:Subject:References:From:Subject; b=ABmwWex0sP0lYEIcIjTjs4drZf70Z4qv9FFzC0ONk90X+by8EkvuAFFWGpBGzH/sUJTOGD8mZ3MaZQ796khTGBAvOXq7JLENN2DBanHWxPJRJFfTspgKV9Y59z+jF4n0wsw9wYJUAbRJDXtmKcZhsHdmPTmXZtVTKZj9sjLkICRYhx43eaODlN3RkD4OuMlb5Zyg+glOC654mMbUMcWhvcBWYPGHfj+gTaGK1hoK4uaQ17HwXzypiuZUwuXAc7bcE06cjg8JBEReG9JbHJhi+kV3cMyh90+kKizAJkPU16eWisvtyGmZVZavUAR0YPaJN6HerG9w/dYiVPLbuWEWEg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1603014325; bh=0i3HJgI/64gk4mOdXlaKEFQW7nHlT+VtUnODfRu+t58=; h=Date:From:Subject; b=nOHZfmDv6S7C1omjaoGmElZNBRnAyyosgPsZiwv48W0KHBmjDBQ9RWV/V6TXcaSXEdK/HFHPZSbWHy3DEh68vnPFNNGaBvHoKZL6UCUkZEk3b0j1+F0LReZDGmnXNLCd1SMBNbkNpVeAX1MraT04I8WKexqxJQcr0ofSJmUSVe7rqWOzj+wL2tG0LYweJdohbIkvmw6ch65zmTNnXnc3MGP2BfwxJO2+ghRE0FuCeXNGGEt07FXMQlfgQDnnIFD1iPGxiPrc+lOVMEQeoMTdrfBkXKN2T1sKQJo80jlrI7DiR5QBQe1k3H18zlmlAf5KfYdKPvC2B9luZ6lOJBtZyQ==
X-YMail-OSG: WxRIYnQVM1n2pOnIKkzcLOqvU4v02tfRC3wdeZYQ8AP6mdfMwAqThuXBspOOJFU
 doKqhhypCw7RL3PgG.M5f358vjBjgIE3FzqGCSN67I3hp7YmQtObPX.uHyhjQObPDx5O9OY1NmO2
 fb7tAAx4tv9muymMpIHZPfb8CT9eppxEur5jt2hFcsHMbDJUIOz3hwic02Xf36LslmTjmTnOmjHy
 SDLJbzWTDZI2rSjHjoD1pijDmX0yeInsYUvg9pTerG0UdNnbPg9f0aEAPL6ApIl_v6gWqhTHedVU
 Qf_aOmOADeRSgXvmECbyarBGX_rXtZoE4UtRaGhCWiUQSH.FS9nVsvzMMZyjLHI5ef7zbAfCj08C
 DLAQr3hiJio9UsHFKqSl1rEiUZp26nZJ_6qwhZPyFjXVx.0RRjr.wkj0lJIldJtXU47Xvo4s.8i2
 xdbNdFBZQ7W5p7SakNOSJ9O.B9UL0fZKlL3vmJivPoaEI7D3T8oAXuAqopkr1uCix.fBXjBbFyss
 p2PZZk1zy5VaWBE5QK9Bd5aJobHkxJtE2EIUvpKNAX4FKdS8w7h2vDrQu7iiimEp_2KBs.kNkfch
 wq__3dX0G1QD_ezfB59ES.8VXt3R8OTNMafhpe6CKD8VOkecKltECmKejYxAFtpTtcN7HEAzXolD
 ZVjea37gnB31n1esewCj.i._dTbdyFxGr.Ci3DY2mom6AkYoPX1x.oba4MhSfaoA3sugK.7An4hZ
 2Bv8YtiHvzGweJ6YVXwsOnEpsQtK5SVrxL6050BRNJ85JdKW2Ahn_h5dUy9HJcAoQo3Ed4dNSl.j
 Vw8sYXcAthJSFN44vg0BYHBB4RMlZlltWBmiGnass76AoVoy8J2l6FKI78kpEzm7wptjr0b6V9CS
 ApdNxrmtNU14UL6H2j5AHoDNfK5bvWj7qey_PsDG8oicpmdrO5FTpfKLOXNCtEPpzbz2HbQxj.s0
 rtjubxn961ojzvUut.OfBgYBqOHuOsOTYNOR7KR263Kv_8diEA290Z.PwyzmIbgNMM0qZ1sEanGf
 rpxCJ3spTV2MybLoO6uTVbuDYEajTnju5jSVicmGMs89JNCMhcutpmE4_konh6wRsTn2qsBgkv58
 iLrcB6VVS53O_XrFJkMpK4qgmfn1cJHymOfNBGK3TRqjmjqSxevco725r9ulRJPoNCP5jJ2mTTP.
 3_FhqJ1kFTTK7xmcdzQtqzvWo_6AE5uHbkkeP9igXhJpHKOBjg6ItoodF.cOBl_ih0CT.roWX9zQ
 DcnyqE4wBTs.2LBndSo2SSKlZ1rH2psJfGXkboXbMzMVfuDiyaRTYzFok4HO9X8LQAodcQ9D0gko
 w4ZYwuGapAzaY375tiIfy1_CdKMo2e06rhTM9dPW9h4Ia8bym7DfwYzS3NKVj9CTpdCCtI4jyyKB
 XEwqudz0hns8HOmRkB1wMnyT5sUDZ2.a6u5WIDNhDZ6BpJYA-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.bf2.yahoo.com with HTTP; Sun, 18 Oct 2020 09:45:25 +0000
Date:   Sun, 18 Oct 2020 09:45:21 +0000 (UTC)
From:   Sophia Lucas <sophialucaspatrick@gmail.com>
Reply-To: sophialucaspatrick@gmail.com
Message-ID: <2143131016.472886.1603014321772@mail.yahoo.com>
Subject: Very Urgent
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <2143131016.472886.1603014321772.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16868 YMailNodin Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 UBrowser/5.5.8807.1010 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



 
My Dear


My name is Mrs. Sophia Lucas I am a Norway Citizen who is living in Burkina Faso, I am married to Mr. Lucas Patrice, a politician who owns a small gold company in Burkina Faso; He died of Leprosy and Radesyge, in the year February 2010, During his lifetime he deposited the sum of (Eleven Million Dollars) in a bank in Ouagadougou the capital city of Burkina Faso in West Africa. The money was from the sale of his company and death benefits payment and entitlements of my deceased husband by his company.

I am sending you this message with heavy tears in my eyes and great sorrow in my heart, and also praying that it will reach you in good health because I am not in good health, I sleep every night without knowing if I may be alive to see the next day. I am suffering from long time cancer and presently I am partially suffering from Leprosy, which has become difficult for me to move around. I was married to my late husband for more than 6 years without having a child and my doctor confided that I have less chance to live, having to know when the cup of death will come, I decided to contact you to claim the fund since I don't have any relation I grew up from an orphanage home.

I have decided to donate this money for the support of helping Motherless babies/Less privileged/Widows and churches also to build the house of God because I am dying and diagnosed with cancer for about 3 years ago. I have decided to donate from what I have inherited from my late husband to you for the good work of Almighty God; I will be going in for an operation surgery soon.

Now I want you to stand as my next of kin to claim the funds for charity purposes. Because of this money remains unclaimed after my death, the bank executives or the government will take the money as unclaimed fund and maybe use it for selfishness and worthless ventures, I need a very honest person who can claim this money and use it for Charity works, for orphanages, widows and also build schools and churches for less privilege that will be named after my late husband and my name.

I need your urgent answer to know if you will be able to execute this project, and I will give you more information on how the fund will be transferred to your bank account or online banking.

Thanks
Mrs. Sophia Lucas Patrice

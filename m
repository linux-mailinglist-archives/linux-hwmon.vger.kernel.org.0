Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5B727F559
	for <lists+linux-hwmon@lfdr.de>; Thu,  1 Oct 2020 00:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730326AbgI3WoR (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 30 Sep 2020 18:44:17 -0400
Received: from sonic308-18.consmr.mail.ir2.yahoo.com ([77.238.178.146]:44996
        "EHLO sonic308-18.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729980AbgI3WoQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Sep 2020 18:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1601505854; bh=mZFdy6s88lY1OfVHZCNBCNs7w/HtpGg9ZKvG/5VhQN8=; h=Date:From:Reply-To:Subject:References:From:Subject; b=gqaZiWiIPyKlMonA1iYrBqYrixNbd3tColEXuC8qmQomrFqvz16wUBManTTlWfOIq2LUJ0e67WgxLgY5CCbFMJi8q2d0FC8lHnP6iL/bj0FZoBzBrbj2+kob3qBqqJadjbevPPa+KAbxmW+21rZX3jZ8dg2kkQ/Go5VlnXV5f0kgQjzLHlksNBKUZqhYL4KYMtxb+G0+L43bX7+CR0OrCr8wt6YQrd2Wl9GpmNah5PMcrX+nrBtBWDySGl0zMoL/NghbwvD6HYPws2JhMZGmnQTmXJ51iPBACNMFc4ZbNzXbqcHL0gEb0xccI6UfSxl8vpwEHO26DT3MdRGw8nCQGg==
X-YMail-OSG: d5kLJboVM1m93ysVigflb5VD9DToM2ZN53PNbiJAazKdOHCwy7cnjaOp8w3XCIb
 vLNzvyCbHepNHd4x4NoWPEgFS44pE75THERUk3SMRq1os2GEgTwpBtIG4xUcd7ZiOoE_xJcu_FWQ
 5t_TNjPjoOGq0KixXWoW9pVXx6EFHH9I1wh.YHQGhT2802bPKkpnH0ZDdOCqd0x_7UTmav2VKgkY
 Ztq2C8ye_p_sQ8dQfRdjO.w3HmXKbHIKo7HEC_iVvySpv8kSZ4BllsLKm3JKwwzTVGoZYEc_u0C6
 k_5NrT.WJoUWdM6VyF5uRRMxR8X2gS01HxkO8CogI.ZpJrEIoZn70ObEd7wsjaiB5SgYtnJm.KHz
 YsCjUmKAhq4WJ8abv9zL6t4hjPvUJIK_eAE9Up_kX12JZG3cLgnALYoU0pRMAZgCB7JvtHU6hQR7
 DB1OPT0CiBy8oBjI80KXcgznPER9rOS7G5AFd_OeeGg4WnfZlpFgkqIOWnBf2d0tfU4D36lIwhhX
 FWzh57_KRebedQKOvBOl3q1sxDYMW6Bp3jjcuiDQC7kyrh.MLZnB8aRiS9QDzguKbaXD8ZixUOJF
 Wwpi9yVLDYzUtHg9d7QU7jXHe7rOUYn.xYdUti5DxF7jROGT8kn_RSL9XB6nX1ieZR49vKDiQMlr
 uZBnVvmAPM8L3c_0PIhD1339rL4OMAW3b8RzN.FMpkpMy37U5rQA_aFM5duRiKxqESwztXlrBVU6
 MfQrcdG4HSqjRezPQOJONvJmcI0N.8qHerzM0Hw5HSEos2SNdglpgEZaAmsd_WlbWC_YeoqwNbs7
 _bCzlwyP4euERJ4etL.q.5vIM7kUk0JR5nKANL944ta4ZRvQ1nXBKwN56b8BrTyxea852.bsIhXl
 fdyyPv_ig61s8nbipGfkzvV6YY9zUto5zhn006nEWcjw0AHju4aQqBfSZ0BDRKx3a0y.2c_uxBVN
 b6uY2IWiLkRTcYGSl7b95z72affPheLAz741PPfVFhzx7p0z88N_qOUDm9msa2fdu56p.pjUB.fS
 el4pi89y7lfLMkZVUNGMIx6djApeLdL4we6gh18G2VwM84DGMa2Kf6M1flY8Oxgsiwcsc6ZBVqhe
 anWp8296Y2iBuZ0nPunxomZl.M5lGs7qrLqIrvmxkMYrMMLExBCPgQfpHEomV8SfdorNcJ1Dvv_D
 R7K.7xUEenNmSmMdcum81.O4HQ8_D2ZYQSLGH3SeucQWLkdLwFAektxoGxjfih3eVTv4GUGNUQoN
 q5J6LAGy4.KPs54f_kqLviZ5JNfhiE.8veBn6KoKbFbVN4rHcRAlyc.aZ6xGmq_Qv4ycRSULpYsJ
 Rvk61oN6Qbv3a53S9TM1M7vK.YbViqc5hIAXRKQptyJI93FykARVW_IlUhLDWfxbtEEQznKCPrTa
 LqD4StpJGq3Ehfl3ed5TE4R0Z5pE.36KRukSKJIQdK64kCiryKCSTSfg-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ir2.yahoo.com with HTTP; Wed, 30 Sep 2020 22:44:14 +0000
Date:   Wed, 30 Sep 2020 22:44:11 +0000 (UTC)
From:   Sophia Lucas <sophialucaspatrick@gmail.com>
Reply-To: sophialucaspatrick@gmail.com
Message-ID: <1200852621.725502.1601505851501@mail.yahoo.com>
Subject: Very Urgent
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1200852621.725502.1601505851501.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16718 YMailNodin Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36
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

Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92D6293552
	for <lists+linux-hwmon@lfdr.de>; Tue, 20 Oct 2020 08:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404277AbgJTG4c (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 20 Oct 2020 02:56:32 -0400
Received: from sonic302-1.consmr.mail.bf2.yahoo.com ([74.6.135.40]:40237 "EHLO
        sonic302-1.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730487AbgJTG4c (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Oct 2020 02:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1603176991; bh=dmrXGoOcSWMF2SnlezJ+xBbgkxN4SQugvVtmdIdRXqU=; h=Date:From:Reply-To:Subject:References:From:Subject; b=Np1paG1iKJJyQohiY87x8qzxNEidQ+Z1fDEFhnksPASdnpe9zv3U663ALIFLykbc85/MAhrI7htAApjqILP1+Bg/LLH1tzyOtvJ/VdqtbH4mH15Y6F+dO8nsk4QJF4ZpLy0L7B/ghlEU+aEeLanpTC3px6CEs1YNTmB+zeC9wmmEvNIwb66ykyDIOrT2UKjPM3jTaW6U5zxuyoH5y7yDtdFrbDG7bkLkaGmS8KSAPxb/BugpI0AG+aVuAqc/kiQmJxK+aZeCVKSxNpRd/OeR1XKo6Vsk5VmHYPYs1MK6SciAF5cVPTlzuTopu2MvT3Mcx9Arm8oyEcoDHn91JOMW3Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1603176991; bh=MA+59q9NiVRDOc1IOxwEHcaJlCEusg7tETwBs7H3WsC=; h=Date:From:Subject; b=BzXqizR9weiIaoMS1vjvZxsqT3o4fvqNW7RAGFNL2xnyFu/fqpi75AzOZIv4wzDD3pSQgkhdrkFy0fJS6BZfSO+S0UrrWK8QP6H9/8g1hJ0IRFPqmiBBBoeNPRVRTCDVO6O7Y0g4MB4mlSX1YLQ2I6piqFVPIfcYOBvksYQc3aEABN7GToUI2ztbg6t64UkQVNtMZepOXXU0Zb8MqGpP5S+eHtLBAy1KL0SBX1Sq3RkGonKWz5POSIujkVpqnByYTIWu46f3efqTJlqpOdX4g1W925rN4m5tBezKwK/l54uI9jxxdYlJ3ZIeM4nOrpWvMWGyt2zs3zcgZJUmr0Hsrw==
X-YMail-OSG: lNqkltQVM1nVn365mc0R.tVcbepFv_CIzvXI0ym_btMymNp8in9LthTA6nuVt1.
 YI.OnbwlEomiOgbzzlIfn9c_Iudk_H_6BXnBVht_67eIn2AWp_Y_VV_yB.i_NdKK7LfXYY5T1vSm
 noVbQumzFIV.MFxY3ZBNG52No3AlAZ_b5jOnfjPPbTjgntn4_kgBXdO.miIP5j0ArucsR8zSf.Wa
 fk709lhY7a8r._Xl4947.gyZoUFQjdy_YboE4SGsWvruAQyjoOrukCVw.5eVUEqg3QrHyUF5_rsF
 a4UnKS_iUWyXL2YJXBn_ZZ98.F6SJoJNaEMswm7ePTsoEvG5a3X8N0aaKSX8U6wA1B_hQLSENBEG
 vqruE.vPZc62KPbuU2a.TcqqBUAi3yPytD2TAOHcM6kr6.k_NdCU37q45VUJDvJJfgO.MtdUS1Sc
 1LkABoWGbNqlZQP9U4HDVL.FkzJgRQXZ9Mn7brKXqeNyoMkNxSpXZ0dMNnmHILQOU7MjZmNecL_.
 taJNzj7G4NMChN_6ASouxK.InNWFBex7pDA7MJxFl0CjqX5jf1rJ5pHnbVfmfA.G5l1SnAb4VvTe
 5hOyBaElHz9tcwJbyFKwM2iSCH4QS9TfWwM5DWDdk5DZXkT.dpbhxzl7z_NwAqFGkPK_ZrSHZMnw
 gr8Tj9yu0vGH4KXnadYeCsQ.ghfQnhTQDBVhaUeaCw3guGtlzAMHuEzAgQl9cJb0h9.7bs49bdgn
 1wziEYOktUcRzAIq4YLxNTQtJZs4vrhqmTNb95Uq17ud3cThBCdInOMi.rEgvyGSQwJO_TLxga.t
 P91Zu553ZDZ0qGY4OTlX6adpfd2OyxYYR70Y2YNQ6AOVyw.twpIH06RF3DM.hqrhPX.XZzh7PJTd
 LdDSRfAk.n9Vz0fzyup26SznEUevJiIJtmeCGK4Q7b4mrB249Y19IHJCwHV8twZ5fL.1bOHDWvv_
 6SsGDs_cihwEOuB6ai.OCLnbEzphjJmkAT0.08VzNuxQ6rumb2YUopR1Iv21CYDIzwpGffL4FAPY
 oEdM5Ep3fbi3jKMsdudhflIm9OZVfP9d53OMNoDOiQhO4.YZmEzhzKEOeDT8jicpQ0Mzotd44AQL
 .gFiUiOWLWPgCsf1RiCZAhjLda_uN52K_raQXh6i3Bgfdhr91nXUFIMCScZ7wt9KOrBDCQMjYZHs
 g0rF1gMdz6T0dRX_DgsKrXjQM9yeQDsl6vyMGvxd_mL43oSR3sG2OdnfZop57VWYXR4mtKblG8pJ
 9WnJIq3aUIFQMiaPMW6rnF.M.jzveVU7bMa_h0Gq2fiPdImoAJt4r8vI75tq_SdfvOg0e5IFnIx7
 ZY3IEF8EVXvjXBAiTEJXhmc3PrGn26FVmEzqYIpJ5zGf1eZf3nW9_zwHEqEXaGpqyO0CiHIwaOc7
 O5sgQV_K7yAZmjANiFdTqCwHNVy78EdUQDxwcmKDvi2n9aITY6YD3
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.bf2.yahoo.com with HTTP; Tue, 20 Oct 2020 06:56:31 +0000
Date:   Tue, 20 Oct 2020 06:56:29 +0000 (UTC)
From:   Erik Viggo <erikv8892@gmail.com>
Reply-To: erikv8892@gmail.com
Message-ID: <1459539721.973128.1603176989565@mail.yahoo.com>
Subject: Very Urgent
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1459539721.973128.1603176989565.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16868 YMailNodin Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



 
Hello Dear,

I am sorry to encroach into your privacy in this manner, There is absolutely going to be a great doubt and distrust in your heart in respect of this email, coupled with the fact that so many individuals have taken possession of the Internet to facilitate their nefarious deeds, thereby making it extremely difficult for genuine and legitimate business class persons to get attention and recognition.

I am seeking your assistance for the transfer of Fifty Two million (US$52,000,000.00) to your account for private investment purpose.

I look forward to your response.

Regards,

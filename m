Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F4D274447
	for <lists+linux-hwmon@lfdr.de>; Tue, 22 Sep 2020 16:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgIVOaW (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 22 Sep 2020 10:30:22 -0400
Received: from sonic312-20.consmr.mail.bf2.yahoo.com ([74.6.128.82]:35275 "EHLO
        sonic312-20.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726494AbgIVOaW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Sep 2020 10:30:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1600785021; bh=ArPeu/gPIi6g9QDeUS4yNz0UNFxcqRT2Xtw5vj1dWeI=; h=Date:From:Reply-To:Subject:References:From:Subject; b=rsaALUbk5DoQ/20NkJtj6rlBS7jzK+CIeIqoqlZFuMWwEJ90KFma0HpGluuzSzmXuEB7hLcVfrX94HJOD80ZsqGg6gL3iEM89NlJ41me3YNODEBCdtJ1FW2L849nqb/4hdyHHONFohm7nRREddxLCiAEgGMNprWw+WPO8q+8XRnNBfoJmRL2ICrzxJXHZ7EmdTXC/cYAFQMu4n1hMkmjfDIktfJ2hnZufgeq0gTZ2h+hWOMs+C81kkesDYSSa2MhrWCK5yKMOE8jkkGSA5rtyNAjlVVXd/Fh2+ea9UJ2O0G9CEfHSVy8A0UuqK5ksiJFlp+LhS59imFT53nuWH3hNA==
X-YMail-OSG: .5CQZ.wVM1mtM6sbBJLdhH_WmHOhmqCMmshX0xVF35kHaWqvfjD.sLkzSyOseV3
 o3C5M5DS45E4SzNoTbRC98vDX6gIxNIyahDUrVObqhDdFaIhYoHpdCODEnMYyWzR.v5dO0BKnjoD
 npKXvyGBN4L08gk4Gc8YZ2Ujs9bEZCGQ1DgKumCg_NZ6zC8jdXRacpWItVPWav5YxKf2iO5sL5Gn
 Eo3v.2QWTA4uD8hHcXM_XaGvC1gxoOu4cuYFBOor3SpVf9ql0HfG2YHWHNT6uJfv8E92hl6JeuGL
 eXhdPTCg1qOtwwYYpQnyWjRgGvGx1cWpTcAEDfZUwy5MtJTAwLE4QVfPU0nHZ0B4HgyeAZgloNiD
 Gg_ODeogCZvrZYbU496Xyf37H1XmwRYOj70B1vmknnf.OTHuKIZ0aKAeyBljEznafZQxc12UTHAg
 9z8TPO_xjo7x9BL7U9tZwe0VXgrYnBKdk11ZDT4z9Asg4XBa3jSUObqvNaaCQJChC9PKolPbbkGj
 3DqFQBtoAGxW0UtUxiA3XO1mNcbJKH523jD2eY9FztFHg3vAvPigqW2sAwvGItzSCyXcirnfVQ2D
 Otds7oSTXJjdfo3qdrgiXxyFQxYY8kaxXhf4uixyWU4Yw70xi.onES16UW1UTA.RPVuI21avRhME
 D_OuCJecl9f6DDjcpr47p4I.MzHDJciDmOoNU0pzEO1FCkCYcvjNttgjjwxy9C4RdlUAds2m.3K2
 UO3BmqCwmouA0_odHjzAvApgqFoVcfdwjNBGFU3Sj0_mKHG85EiDVJAsCKXzA6ZfSaGBJci8RHwX
 jxPcQaMkO0dhuu2pLMRMH.am6zbBTCUkwKMoAQ0KJaP5KOEFjA.Yqbi1ThfpLrfASVIohBD.4K7c
 rwDPoC3TaKjvo3d2yAh5E0DZAEYmSEnu1TKN87y6HlsSWEpsgzieFJIQWSPAj_8LIXR1OZsR4pEe
 wrczOyh3n76s1yenuPnOVL0MilMcMrqORPFbPJL.lSPKxbC_GXo948hVsf5BbynfaOyAeIbTtuN5
 5.peVbBF2Stmb7Q6BF6d0FPV.yd71f4JewWHu36MMOPWL347vrfhN07U.eix2Z808nydpfY7BOMj
 pkfiM.t.ZE9bGm4VebvZsmCrkf_TEnLRIxEtmn0JieGdijyYCFiX9JLwklKLBzfixFfaFPaIm30w
 PxbS9HYjPkohUkYWYFW8JFi0eYnaqfy5RfGOFMgj2lEY2GygrNUa6zvUFa8aKass7I24_kl6YN6L
 v_ABQpB4GggpixqDR1jVH0.Mjso6m.xx9xfdMU7AMI7jCVSd9s9P6AQSOZ20qvrQYt1snJb2mIts
 7whCPTM4OKy.vau5f1mfE7uiHkoUL6SR6D.2bxn2a7VTC0eiZGGFIrhbW5hlfxSoxnsYKpQlX6rI
 Vrs_gipFO_qBqVR2TBhsniJ6WRYmwV1Ok2yGMSO9bqDeH0XQpzEdeo2K0UhGRwQCOPP6JrTyAU2m
 j0fpbI21Z6tki8M6DZg--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.bf2.yahoo.com with HTTP; Tue, 22 Sep 2020 14:30:21 +0000
Date:   Tue, 22 Sep 2020 14:30:18 +0000 (UTC)
From:   "Mr. Mark Edward" <annaorgi235@gmail.com>
Reply-To: markedwardmanager42@gmail.com
Message-ID: <1381556435.4762783.1600785018473@mail.yahoo.com>
Subject: HELLO.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1381556435.4762783.1600785018473.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16583 YMailNodin Mozilla/5.0 (Windows NT 6.3; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



Nations (UN), European Union (EU) and FBI.We have been able to track down

Information from Nations (UN), European Union (EU) and FBI.We have been able to track down some scam artist in various parts of African countrieswhich includes (Nigeria, Ghana and Senegal with cote d'ivoire, Cotonou,
Republic of Benin ) and they are all in Government custody now, they will appear at International Criminal Court (ICC) soon for Justice.
During the course of investigation, they were able to recover some fundsfrom these scam artists and IMF organization have ordered the fundsrecovered to be shared among the 100 Lucky people listed around the World as a compensation.
This notice is been directed to you because your email address was found in one of the scam Artists file and computer hard-disk while the investigation, maybe you have been scammed,
You are therefore being compensated with sum of $6.5million US Dollars valid into an (ATM
Card Number 506119102227). Even if you are now dealing with this nonofficial directors of the bank or any department always requesting money from you,
You should STOP your communication with them and forward the details so that we will help and recover your fund peacefully and ilegal.
Since your email address is among the lucky beneficiaries who will receive a compensation funds, we have arranged your payment to be paid to you through ATM VISA CARD and deliver to your postal address with the Pin
Numbers as to enable you withdrawal maximum of $4,000 on each withdrawal from any Bank ATM Machine of your choice, until all the funds are exhausted.
The package is coming from Ouagadougou Burkina Faso.don't forget to
reconfirm your following information.
1. Your Full Name:
2. Address Where You want us to Send Your ATM Card
3. Cell/Mobile Number:
4. Copy of your passport

Contact Mr Mark Edward on his email
address(markedwardmanager42@gmail.com) or you
can Contact his direct whatsapp number on +22662295810

Yours in Services
Mr. Mark Edward
MINISTERE DES FINANCES
ET DE L'ECONOMIE(M.F.E)
BURKINA FASO

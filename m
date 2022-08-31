Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C13F45A7E1A
	for <lists+linux-hwmon@lfdr.de>; Wed, 31 Aug 2022 14:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbiHaM5n (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 31 Aug 2022 08:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbiHaM5m (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 31 Aug 2022 08:57:42 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D8195AC8
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Aug 2022 05:57:41 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id w2so2781798edc.0
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Aug 2022 05:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc;
        bh=UTdKbOp1WIihacpgzcGLsJZCpkS1HE5cq3MG6vnftP8=;
        b=nYf86XaqlnPakCLNIackaRMaIULw90mgWmZJqWa3fuW618zRmV3X9Cvkh6oiBTYwvO
         +mpf0QK6ogmv0PuzN2FV6hm5aqWixRg/PLbHEH6pr04BCVh44FdoJRb0MHm7aFUqlxza
         xgjslY79eP6qtZAldyLbUMhM8rXRJhDTc9J9ksxB8NOGpA7tbXepr5gNv4MQLh0so1P5
         q8XwnKJDnzBz5CfB6Ni/Z1vc/UDpUPdh5VHCoMH9S3yrFwR5ExdC1d17vJQpfUfiEGlQ
         PTPnabiQeDf3Jf32esNg41EP+l466prcvykSHKcMcSat1DfYtQMLCnrXyWD1vYFssCpH
         mUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=UTdKbOp1WIihacpgzcGLsJZCpkS1HE5cq3MG6vnftP8=;
        b=nIXQGWQOvIkaL8mz8cHSRubgGXN1vUzWhewN72j8HW76JyuoxOWm3BLkM4AjX1QBDe
         VFtYFt2tX/hW72dfwzvdyJHEZ14+rhx9VwqrJfkvfZduM4CwXbQ5Yo4NtvE24JRFW44i
         mqpozLyXAfiSFgQzADNkPRLN6U9Cmkb2xA21bmtBeNHkHbhXGr4QcBoC88D3zzRXZtv9
         elkU5At0y7ps5GtqiXISlO4Tj4+l8JygrUh+qGrcjmQcYNh7G+vTejt8QMQ0vzrW01YQ
         YEbKhtZUaytoyLHuG0TkFCHnFfH2pZi/+5LMg05UieNQEaaPEyGOXGkASWIxJM6YmzfP
         0+9Q==
X-Gm-Message-State: ACgBeo34Z0TV1Oh9gJitAMVmxhco+lwbMZIjiVS52pcyBdoOvNo++nsL
        iLIDQdM6j0KtKqYvdHSXQwJzsAPFQu/4VIwLlGI=
X-Google-Smtp-Source: AA6agR739JAH++ra9bblDTKlZuHIXaavvWJ+UeZXXW/80mvP7eElfd/WlAxHyZeBrfGXZIzGaIGJcposXHE/3rYzTHQ=
X-Received: by 2002:a05:6402:2029:b0:447:aae3:4fa3 with SMTP id
 ay9-20020a056402202900b00447aae34fa3mr24926485edb.104.1661950660009; Wed, 31
 Aug 2022 05:57:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a98:c049:0:b0:17e:f846:72fc with HTTP; Wed, 31 Aug 2022
 05:57:39 -0700 (PDT)
Reply-To: jon768266@gmail.com
From:   johnson <rahamaaliou74@gmail.com>
Date:   Wed, 31 Aug 2022 12:57:39 +0000
Message-ID: <CAHhQV0fe=oBiuf8QyUVvwDpirg6VRKeE3kU+9EOdDu4Winvhhw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:52f listed in]
        [list.dnswl.org]
        * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [jon768266[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [rahamaaliou74[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [rahamaaliou74[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.5 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Jsem r=C3=A1d, =C5=BEe v=C3=A1s mohu informovat o m=C3=A9m =C3=BAsp=C4=9Bch=
u p=C5=99i p=C5=99evodu t=C4=9Bchto
prost=C5=99edk=C5=AF ve spolupr=C3=A1ci s nov=C3=BDm partnerem z Indie. V s=
ou=C4=8Dasn=C3=A9 dob=C4=9B
jsem v Indii kv=C5=AFli investi=C4=8Dn=C3=ADm projekt=C5=AFm s vlastn=C3=AD=
m pod=C3=ADlem na celkov=C3=A9
sum=C4=9B. Mezit=C3=ADm jsem nezapomn=C4=9Bl na va=C5=A1e minul=C3=A9 =C3=
=BAsil=C3=AD a pokusy pomoci mi
p=C5=99i p=C5=99evodu t=C4=9Bchto prost=C5=99edk=C5=AF, p=C5=99esto=C5=BEe =
se n=C3=A1m to n=C4=9Bjak nezda=C5=99ilo.
Nyn=C3=AD kontaktujte m=C3=A9ho tajemn=C3=ADka v Lome. Spolu s jeho n=C3=AD=
=C5=BEe uveden=C3=BDm
kontaktem jsem upustil certifikovanou v=C3=ADzovou kartu do bankomatu a
po=C5=BE=C3=A1dejte ho, aby po=C5=A1lete v=C3=A1m v=C3=ADzovou kartu ve v=
=C3=BD=C5=A1i 250 000,00 USD,
kterou jsem mu nechal jako n=C3=A1hradu za ve=C5=A1ker=C3=A9 minul=C3=A9 =
=C3=BAsil=C3=AD a pokusy
pomoci mi v t=C3=A9to z=C3=A1le=C5=BEitosti. Velmi jsem si v=C3=A1=C5=BEil =
va=C5=A1eho tehdej=C5=A1=C3=ADho
=C3=BAsil=C3=AD.

Spojte se tedy s moj=C3=AD sekret=C3=A1=C5=99kou a dejte mu pokyn, kam v=C3=
=A1m m=C3=A1 zaslat
bankomatovou v=C3=ADzovou kartu obsahuj=C3=ADc=C3=AD =C4=8D=C3=A1stku. Pros=
=C3=ADm, dejte mi ihned
v=C4=9Bd=C4=9Bt, jestli ho dostanete, abychom mohli sd=C3=ADlet radost po v=
=C5=A1ech
tehdej=C5=A1=C3=ADch =C3=BAtrap=C3=A1ch spole=C4=8Dn=C4=9B. v tuto chv=C3=
=ADli jsem zde velmi
zanepr=C3=A1zdn=C4=9Bn kv=C5=AFli investi=C4=8Dn=C3=ADm projekt=C5=AFm, kte=
r=C3=A9 m=C3=A1m s m=C3=BDm nov=C3=BDm
partnerem v Indii, p=C5=99epo=C5=A1lete m=C3=A9 sekret=C3=A1=C5=99ce va=C5=
=A1e informace, va=C5=A1e cel=C3=A1
jm=C3=A9na, adresu a kontaktn=C3=AD =C4=8D=C3=ADslo pro snadnou komunikaci,=
 dokud
neobdr=C5=BE=C3=ADte kartu s v=C3=ADzem do bankomatu. (jon768266@gmail.com)

S pozdravem
Orlando Moris.

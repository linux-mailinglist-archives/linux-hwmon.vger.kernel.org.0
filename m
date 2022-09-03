Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A93215ABF13
	for <lists+linux-hwmon@lfdr.de>; Sat,  3 Sep 2022 15:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiICNNI (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 3 Sep 2022 09:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiICNNH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Sep 2022 09:13:07 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4FA642EF
        for <linux-hwmon@vger.kernel.org>; Sat,  3 Sep 2022 06:13:06 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id y18so3389146qtv.5
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Sep 2022 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=uuGvyW9csfm6dP0NAyjv/9DNFWOcYsoLB8ICieB12GQ=;
        b=fNCC5nQ218MYOF1zw49tQiXbYuSKHwhfaFIDI53CmWymoY1XqYSnTsRcawdscro8gn
         hi5fKFNj418VdOSxc+z+40Oik5c79BGl8fk3/c3W0eCeKg1HMJl17Jkv6lETu4twbB1Y
         ZPy7Vn9v0VHZwwEsTtOVW1u/iQK/lGRKAMtw8sFDJVAC9IJsUPqyBKkZFJ12H1s++KH+
         SpSIbfX3Z6tYr5+r01zXSzQgUCQqCCxZPAcOPxtHYFlrrRA1kXr0S7z5CsidqXhvoozi
         5KCes7cqjd1Zhvx1HbNLCuhb5oNRd9JXFistUIxjoRF7c7oitAI09Ewn/nYgxtSyyOMp
         3X1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=uuGvyW9csfm6dP0NAyjv/9DNFWOcYsoLB8ICieB12GQ=;
        b=vUtFijTJvo4CVQvGbF5ftJyi/+Y1SMtHqEuUrQounfBZzmy6QV6nZEOdS6Ia3Nx758
         7rJUKcrr8dT0uhzw30jSC2t8Qc4UdM5R+PfxXWh/dTrq0p6jihBOxDad9fHRkFfJtMiX
         DeWvsxS2aNrmnlpiNKEIozltLF6KUP0Sd4PEMhWVwfqiXAY8DX7jHiHT5s2DwY5Cj/g2
         Xn3FcNLZPgUJluvqr8MATmLK9RpogExUSpB0VeVeHdxuYAKXYcTMmC2cMmWgP6JYGkcr
         ISUNsNwvsfoFg6c2+KHM3g282riELwDs3c2aTOm5meBSx3eVuSCvG8qxs/CQazMYRNrp
         IVOw==
X-Gm-Message-State: ACgBeo1vf5i/GBXHdyOxHTrN2dvYq7XLvBrgvkYRifkJdj3W2FUd7bq/
        4H/eCcU+AiXJ28qBtrjzzwzdperEDdlaDTFLtFg=
X-Google-Smtp-Source: AA6agR5TaZJ45IDzT943HzFJB7ELHh8/jxSdytkFndWtj90JsfSTiuT5e2kPzOe2nk85I2lBx6bIOlNcfmJCl9m2pHk=
X-Received: by 2002:a05:622a:453:b0:345:2d3:1d11 with SMTP id
 o19-20020a05622a045300b0034502d31d11mr29127604qtx.604.1662210785485; Sat, 03
 Sep 2022 06:13:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6200:5e89:b0:46b:a78:b506 with HTTP; Sat, 3 Sep 2022
 06:13:04 -0700 (PDT)
Reply-To: jon768266@gmail.com
From:   johnson <novelav950@gmail.com>
Date:   Sat, 3 Sep 2022 13:13:04 +0000
Message-ID: <CAPCDeFJWS5YiBmPpVj8k+bRsJU_Yamzs9Jfh2+Xpet9i4qVN7Q@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:82f listed in]
        [list.dnswl.org]
        * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [novelav950[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [jon768266[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [novelav950[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  1.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

=C3=96r=C3=B6mmel t=C3=A1j=C3=A9koztatom =C3=96nt arr=C3=B3l, hogy siker=C3=
=BClt =C3=A1tutalnom ezeket az
=C3=B6sszegeket egy =C3=BAj indiai partner seg=C3=ADts=C3=A9g=C3=A9vel. Jel=
enleg vele vagyok
Indi=C3=A1ban befektet=C3=A9si projektekben, a teljes =C3=B6sszegb=C5=91l a=
 saj=C3=A1t
r=C3=A9szemmel. Ek=C3=B6zben nem feledkeztem meg kor=C3=A1bbi er=C5=91fesz=
=C3=ADt=C3=A9seir=C5=91l =C3=A9s
k=C3=ADs=C3=A9rleteir=C5=91l, hogy seg=C3=ADtsenek nekem =C3=A1tutalni ezek=
et a p=C3=A9nzeszk=C3=B6z=C3=B6ket,
annak ellen=C3=A9re, hogy ez valahogy kudarcot vallott. Most l=C3=A9pjen
kapcsolatba a Lome Tog=C3=B3-i titk=C3=A1rn=C5=91mmel, az al=C3=A1bbi el=C3=
=A9rhet=C5=91s=C3=A9g=C3=A9vel,
leadtam egy hiteles=C3=ADtett ATM-v=C3=ADzumk=C3=A1rty=C3=A1t, 250 000 USD =
=C3=A9rt=C3=A9kben.
0,00-ig hagytam n=C3=A1la, hogy k=C3=A1rp=C3=B3tl=C3=A1sul szolg=C3=A1ljon =
mindazok=C3=A9rt a
m=C3=BAltbeli er=C5=91fesz=C3=ADt=C3=A9sek=C3=A9rt =C3=A9s k=C3=ADs=C3=A9rl=
etek=C3=A9rt, amelyekkel a seg=C3=ADts=C3=A9gemre
volt ebben az =C3=BCgyben. Nagyon nagyra =C3=A9rt=C3=A9keltem az akkori
er=C5=91fesz=C3=ADt=C3=A9seit.
K=C3=A9rj=C3=BCk, k=C3=BCldje el neki adatait, teljes nev=C3=A9t, c=C3=ADm=
=C3=A9t =C3=A9s el=C3=A9rhet=C5=91s=C3=A9g=C3=A9t
az egyszer=C5=B1 kommunik=C3=A1ci=C3=B3 =C3=A9rdek=C3=A9ben, am=C3=ADg meg =
nem kapja az
ATM-visumk=C3=A1rty=C3=A1t. (jon768266@gmail.com)

=C3=9Cdv=C3=B6zlettel
Orlando Moris.

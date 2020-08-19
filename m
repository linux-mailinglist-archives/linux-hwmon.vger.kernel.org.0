Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2A0249F0F
	for <lists+linux-hwmon@lfdr.de>; Wed, 19 Aug 2020 15:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgHSNFj (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 19 Aug 2020 09:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728203AbgHSNFd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Aug 2020 09:05:33 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46772C061757
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2020 06:05:32 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id t23so25311705ljc.3
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2020 06:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=UOr65DEC+2TW/zt7uOWWliltVKZ89UsSxVAE/jQE1oM=;
        b=ig0Gowk5bmmRlwDUQnO4y6TgS8TPTr7rVwwcxXCQXtPl9HhW8NkXHIv6B+duOf3lp+
         gZutF2zFShkzk3CYvXCAeuEulGsoslBHGNBCkbZ0TFRBc/2Ut0qPqg866dt7JyzfnpIJ
         68MXFvQRcMsKqEVR4y3VTJ8rtpMbgZLWt9J6jDkIWlQW65MyZaERS9MyqVWX9fy2Isez
         xsZ5vi3MHowaVKhMg33qFIcX7/quCIco+02R77UBUKxvHC/xluOIqC/Lr5qYci7AMVZf
         PyXAFBj4/F7uT7Y3iuvrL7XB97GjkJ7iLwjZ3dF8czzNndQEsJq65DDKMcngHG6f3kPe
         i80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=UOr65DEC+2TW/zt7uOWWliltVKZ89UsSxVAE/jQE1oM=;
        b=NlhoVd/OCeHYpftgIEmCotJQeD0i2FYUR2yQY8iRhCpd+p0jHO5aJuz4yFqTpJQeX7
         1C0CKqoMOts1U+qyEFUJMYP4YYJ/OSmALqZqcobzK9q0xankgTtgbijrP9pK4YeSM9Pj
         /wopk+o/d7jg+eRYcXX2d2qOQSz0TCTdRpc/xIzW7ov9x+G69rAFad5oNkEgrEbYtFqy
         EULHD66caiOqNko6Qdt1DlXT0J5KLyFRdNug0PWTnML6eAJ0/VFCqbvewvyrWC5W+Fsv
         D3oW4eAjEcytFg+UQMkZax9BHOPP4gCKz/pr6+5m2vR7nY2FNbeXEUiDusSXZcQLhezU
         970w==
X-Gm-Message-State: AOAM531aFrlDtjLB4bgJO6wAgMc+L0A5UWYN/SYH8BjmR+nL9lh7bPkz
        8VLdFHINCVvqaW/XaMoCr5yrv3H2TpZk9KbsFy0=
X-Google-Smtp-Source: ABdhPJzTFitFWyqH5VgBxrEeiqQ4A1POexli1AXmA+RrBIO5haBPhDqi2mygN5Tr7sNOxSaOFMqW2cDUGzlZZDUdK9Y=
X-Received: by 2002:a2e:9ed4:: with SMTP id h20mr12179547ljk.82.1597842330702;
 Wed, 19 Aug 2020 06:05:30 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mrahmedmuzashah@gmail.com
Received: by 2002:a19:4c57:0:0:0:0:0 with HTTP; Wed, 19 Aug 2020 06:05:29
 -0700 (PDT)
From:   "Mr.Ahmed Muzashah" <ahmedmuzashah@gmail.com>
Date:   Wed, 19 Aug 2020 14:05:29 +0100
X-Google-Sender-Auth: lVrhDL8Mzkfaw7v4sU_7WkA5sWQ
Message-ID: <CA+ANWpm8x4guuGELAxYevxXhqEEr=BWtq6-82y7LV1LmfG2PzQ@mail.gmail.com>
Subject: =?UTF-8?B?U2Now7ZuZW4gVGFn?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Sch=C3=B6nen Tag,

Bitte entschuldigen Sie, dass Sie einen =C3=9Cberraschungsbrief geschrieben
haben. Ich bin Herr Ahmed Muzashah, Account Manager bei einer
Investmentbank hier in Burkina Faso. Ich habe ein sehr wichtiges
Gesch=C3=A4ft, das ich mit Ihnen besprechen m=C3=B6chte. In meinem Konto is=
t ein
Kontoentwurf er=C3=B6ffnet Ich habe die M=C3=B6glichkeit, den verbleibenden
Fonds (15,8 Millionen US-Dollar) von f=C3=BCnfzehn Millionen
achthunderttausend US-Dollar eines meiner Bankkunden zu =C3=BCbertragen,
der beim Zusammenbruch der Welt gestorben ist Handelszentrum in den
Vereinigten Staaten am 11. September 2001.

Ich m=C3=B6chte diese Mittel investieren und Sie unserer Bank f=C3=BCr dies=
en
Deal vorstellen. Alles, was ich ben=C3=B6tige, ist Ihre ehrliche
Zusammenarbeit und ich garantiere Ihnen, dass dies unter einer
legitimen Vereinbarung durchgef=C3=BChrt wird, die uns vor
Gesetzesverst=C3=B6=C3=9Fen sch=C3=BCtzt Ich bin damit einverstanden, dass =
40% dieses
Geldes f=C3=BCr Sie als meinen ausl=C3=A4ndischen Partner, 50% f=C3=BCr mic=
h und 10%
f=C3=BCr die Schaffung der Grundlage f=C3=BCr die weniger Privilegien in Ih=
rem
Land bestimmt sind. Wenn Sie wirklich an meinem Vorschlag interessiert
sind, werden weitere Einzelheiten der =C3=9Cbertragung ber=C3=BCcksichtigt =
Sie
werden an Sie weitergeleitet, sobald ich Ihre Bereitschaftsmail f=C3=BCr
eine erfolgreiche =C3=9Cberweisung erhalte.

Dein,
Mr.Ahmed Muzashah,

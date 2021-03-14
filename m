Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC51433A897
	for <lists+linux-hwmon@lfdr.de>; Sun, 14 Mar 2021 23:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbhCNWhR (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 14 Mar 2021 18:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhCNWg7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Mar 2021 18:36:59 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D55EC061574
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Mar 2021 15:36:59 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id h6-20020a0568300346b02901b71a850ab4so4232866ote.6
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Mar 2021 15:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=tlf8w447PnkWDa8Ig8yXLZ5c7078B/Fouco3NbjfaNQ=;
        b=Hk1EV1NsKXhhTA3EidUsb0LYhZ5KxBWm9k/rKVsf4zJLFKRMKkCbnu57wG/vz88TNG
         V9kNZov2FPb0XlSOeZ71dh5WUXynXGCB9WwOLzpdstF1TYxUOc4RtzQWfRNZgUiS18NN
         byh/O0efPKeZfOLpyek3MGYlx8QP6VSOh7qfq5aB4m21BMbDisv98ZjDjjRpruGKf09F
         lBrI3MTqJ0a+2kqwhLM78v/CKaeslz5z8Yrw4LrDOXTwr3pR8QdhQzydYl0e96K1sJi7
         re17lBvsHyHA3GPvsUkUgJReZTzIAKAjGU09F6MLqXvYAPKWZuCHjf2N84znMkTHB+i9
         RU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=tlf8w447PnkWDa8Ig8yXLZ5c7078B/Fouco3NbjfaNQ=;
        b=KXFulCCQu9Tzq2UYZb5o4IJ9QA6pbbyfoLx8wtiLv/XgXc18baQ64NbG71v2B84dNC
         deAg78xwPBpzarwPu1OXAzwAK7oJiVRodR7ZPku6S4Aohrpb94H7vq6Om6U9FldJzNeT
         qtM4L6OpJB5uaup7c3x+tIecMryptLO9NcStU2MZGu9PN9ah3AaehUhkFlm9C9GfkhzV
         jcUxPdt21CzJ+BLOvgx4mP4Tig2pUvL7S8UZXcyox/tzvGrjKM1A7mROiZk0KhVzcVDd
         1pPeq2PQ4gYzc7VVLQK6tGNXXvBYWqrbizFAcB0n7B3OBIQ6mt3Dq64kb/iOhgetcKhP
         KTuQ==
X-Gm-Message-State: AOAM532jKOvJUI6BRVUxwB1tymSIYZvxO9/jrE5m9q45gZ09zYaHsWvo
        a2/1vCd88YekjYWRuvHETmPNZiURO04PRtfECLiqxfu/xNlgOg==
X-Google-Smtp-Source: ABdhPJwx9JxXfmqqZS+5F5TjukdGHZ2LH5Bz33nUrMBkhXNUK8csea646d8LrVjkFdIjKmt6Bqo1fE+bEEztwC8+eOA=
X-Received: by 2002:a9d:4b9a:: with SMTP id k26mr11775888otf.326.1615761418955;
 Sun, 14 Mar 2021 15:36:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:61c8:0:0:0:0:0 with HTTP; Sun, 14 Mar 2021 15:36:58
 -0700 (PDT)
Reply-To: stephenbordeaux@yahoo.com
From:   Stephen Bordeaux <awereoufaya@gmail.com>
Date:   Sun, 14 Mar 2021 23:36:58 +0100
Message-ID: <CAOzKD-Oh1AqxH6yL0pVfm1ckr49igUM=Pnw2VPN60jBTt-uXCA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Ich habe mich aufgrund der mit dieser Frage verbundenen Dringlichkeit
entschlossen, Sie zu kontaktieren. Ich bin Stephen Bordeaux,
Rechtsanwalt. Ich pers=C3=B6nlich bin ein Treuhandagent von Dr. Edwin,
einem weithin bekannten unabh=C3=A4ngigen Auftragnehmer hier in Lome Togo,
der mit seiner Frau und seiner einzigen Tochter bei einem Autounfall
ums Leben kam. Ich habe Sie kontaktiert, um mich bei der R=C3=BCckf=C3=BChr=
ung
des Fondsverm=C3=B6gens zu unterst=C3=BCtzen. Acht Millionen f=C3=BCnfhunde=
rttausend
Dollar auf Ihr Konto. Bitte kontaktieren Sie mich f=C3=BCr weitere
Informationen zu diesem Thema.

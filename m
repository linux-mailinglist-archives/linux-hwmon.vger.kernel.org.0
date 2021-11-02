Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E19E44358F
	for <lists+linux-hwmon@lfdr.de>; Tue,  2 Nov 2021 19:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbhKBS37 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 2 Nov 2021 14:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhKBS37 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Nov 2021 14:29:59 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE71C061203
        for <linux-hwmon@vger.kernel.org>; Tue,  2 Nov 2021 11:27:24 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id b71so75150wmd.2
        for <linux-hwmon@vger.kernel.org>; Tue, 02 Nov 2021 11:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=aZ1qACKNp6s690RtJWkkxKsMw0YuJS6984cWR7xm12Q=;
        b=XGDsh3Y8M5HGW5fPWPWhaVIf40yxG7yQkrnZQLSbGFylX6nfX8XwH1frolucTD0Pzq
         9al8GmCdYni3XDiuEQUedTnXadLYjSESTNXgkX/pTkcbzAt4jjS30Qhf5L9OYsrRnnX4
         wi+LsTuHzcC+pKqqnebog5Fx12FkraRwVB77vDAZQElUr4yzt+q1u7O+JIhodKo9kz//
         lspPDFwgYc8nEVcEA5OjKOVzD3PgU2IiFIAbBL991g/L0SrdqD5K0Hsd0juzupcTXxN5
         IWeFLpDSqeMPY5z9ImpXaSMbMXbq/ajZytX+Kvh0mRgHdTYiXvLKoCl8Wx8iRzwBLboG
         EWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=aZ1qACKNp6s690RtJWkkxKsMw0YuJS6984cWR7xm12Q=;
        b=7rjOkGRXu8LKho3Mce8x3/jhocpjU/q0+JnDjdu2o1KJ4RVDW/klIM34sa+7fwcI+4
         2ktun/odilPpJjkDdJ1dZqBx8vS3DL6lt+NwbFDSKAtp7iv8jlcWwTLCENRPkm138fZx
         e0ILBuVT1dlbVf+4Iuzo/f1IBo0LvgNkh01v/ygkuui4v2yt+ZU3UFk+5tPAWEqqvzXe
         gpPAMLj4HA0W+3OFKhPbpre5jN4QWJ2HK3J0b3s/ZJV5gTf/4F9/3p9v6oavYzvWMp7h
         X5AW/bFc+1LMHHH6NAHXyCfSBkE7eNGAPpre3GbqE9PFBZhqPaHGge5DBLLMiU7zuM6i
         uC6Q==
X-Gm-Message-State: AOAM531h2KlWg/whUSCUgXS56BeIX+Rtx5C/pC+EewRR6ViTOhq3Cf6o
        G8oQkW7k/sXUZZPLkQTcP84BwymxBt3bBRpkAGo=
X-Google-Smtp-Source: ABdhPJyccNIpxNumEB2hYpMjiDsBL40OmKJFdFhgm4Xm3PHUxJRTafTlO2KGXUkDCTKuQBiKA9+EwxWy/tOnSa2euh8=
X-Received: by 2002:a05:600c:430c:: with SMTP id p12mr9491478wme.127.1635877642725;
 Tue, 02 Nov 2021 11:27:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6000:18c7:0:0:0:0 with HTTP; Tue, 2 Nov 2021 11:27:22
 -0700 (PDT)
Reply-To: alimaanwari48@gmail.com
From:   Alima Anwari <khuntamar5@gmail.com>
Date:   Tue, 2 Nov 2021 19:27:22 +0100
Message-ID: <CAOdLAAKFk3_zRyH-e9kCdWRy6mLTw2QHmMWAq3O1KyZ5KZmNyQ@mail.gmail.com>
Subject: =?UTF-8?B?xLB5aSBnw7xubGVy?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

--=20
Merhaba sevgili arkada=C5=9F=C4=B1m, ben Afganistan'dan Alima Anwari, l=C3=
=BCtfen cevap verin
bana geri d=C3=B6n, seninle payla=C5=9Fmam gereken acil bir sorunum var. be=
kliyor olaca=C4=9F=C4=B1m
cevab=C4=B1n=C4=B1z i=C3=A7in.
Te=C5=9Fekk=C3=BCrler.
Kire=C3=A7.

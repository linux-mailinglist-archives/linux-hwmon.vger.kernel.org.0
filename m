Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85AD1468A41
	for <lists+linux-hwmon@lfdr.de>; Sun,  5 Dec 2021 10:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232771AbhLEJY2 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 5 Dec 2021 04:24:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232770AbhLEJY1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Dec 2021 04:24:27 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11F5C061751
        for <linux-hwmon@vger.kernel.org>; Sun,  5 Dec 2021 01:21:00 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id y5so13868850ual.7
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Dec 2021 01:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Av10FJHZ16PNlaWBwLeHhLYMKvHi/4lm87heoggNDKA=;
        b=l4vtkMjxLtLfkjCy5NHsc69Pv79lEBD+94ZBO+QziUUb0qR1ExFZU/UQYGtBj2xSDC
         Gx8wtvVy22JlP1puuehnvLlMuJFuKFHZqmXdtQI7vqghJ5PZPNCvdN2a3JlUQhTumkmE
         VGoLJUEL2a+ZOgifCJbkPAKHW5w60DCJ30IB1mgfKmqfxF/WqN4CkCwrj+rlWJnf4A5t
         fIBqodCqewWbQBwqh9Hr22E7QeDeU6/c980jv9gL4t4Lv71Msr+FkXUv3ZMKdXee3NPt
         bPy7F+hORk40NFQpzZZthV9vFv66XQ1Rv62tOZVoHlBJxnOs2UgR2ffgUfTxLIkTFUzG
         PIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Av10FJHZ16PNlaWBwLeHhLYMKvHi/4lm87heoggNDKA=;
        b=1clEsz3funnceEMhP6WrXFNtLbKhkLWX2lvohqAMyRDjS+/HYIYMBLI4OafHhYBCM7
         HkMurjDq/5aXKSIjlBWfpIaLp16RsH+56CWbZ/Wo8x7GqRBFtTZsKCXLp0PSuz8YKR0j
         fawVgA2MUlsL0ubiPyCyoezNuDaD1DT2NPybXhKoSY6Au+Lutz7utJ2I3JqRjfq1lwtl
         549EA0yUWGkjjMMg+OjMwdLILodGrBprYoM81kHhJHyrZS4MeqkQU5NQ9wHWndjoH6NM
         a0s6F9VIxleWL51I3VIjcEJLm2ehEd5+1OFW4rTZRfa7mSm7NWpmVGlKALCdH00WH8qT
         yLaQ==
X-Gm-Message-State: AOAM533WcV0ttmVTNKanjq/7HVXroMiXD1uPXGwtuUUwGhTzHo9B1t7p
        KYMTLEjgtFRx3K6DhvTWOQRXqr1QqY1MqbhPZro=
X-Google-Smtp-Source: ABdhPJxvXACVmD6t+qBO7aXBgkTBrlFbh4/Yx4p7NWGvy18TmigtbKhoSGmaPdqaZg6wW6VZiRdZ3N1NDtKjeDLXuM0=
X-Received: by 2002:a05:6102:3232:: with SMTP id x18mr29457876vsf.38.1638696060103;
 Sun, 05 Dec 2021 01:21:00 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a67:c784:0:0:0:0:0 with HTTP; Sun, 5 Dec 2021 01:20:59 -0800 (PST)
Reply-To: fionahill.usa@hotmail.com
From:   Fiona Hill <tonyelumelu67@gmail.com>
Date:   Sun, 5 Dec 2021 01:20:59 -0800
Message-ID: <CAAVnhxKJxn3QoE=YKTRd=-9B8QK7pTrECMk2heZ4qxSsaToFaw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

-- 
Hi, did you receive my message  i send to you?

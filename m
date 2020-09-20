Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907CD2716D7
	for <lists+linux-hwmon@lfdr.de>; Sun, 20 Sep 2020 20:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbgITSJ4 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 20 Sep 2020 14:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgITSJ4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Sep 2020 14:09:56 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9DEDC0613CE
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Sep 2020 11:09:55 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z1so10470037wrt.3
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Sep 2020 11:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eWLNSIgbcx08j8Jnp6K7XcChlcRyHaGlF+YupaR6pks=;
        b=rP32QMdkJu96V7EwnmvD5+r/cuSjk16Hx2SXMn7ELQxeo/2I9cw3zBbSe+uWAk0+AI
         Dhw0nXbeMriQFuO6LcW3vU+T+KPDX4M9Fvi9ZyLSDyv92JHe4sfeFt4O3sbdZ0OBs8Xm
         6C/e3gVo/yD+HjhJu9OADafQhD9Ub177k3+vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eWLNSIgbcx08j8Jnp6K7XcChlcRyHaGlF+YupaR6pks=;
        b=jaKzlZ+OF/BOR63upl/KXBUwhwo+AfF0bT+B2JW7WHsYE6nUyJBhBYoG2Meawse/vO
         Bl2B4BcKVqTn7hmFTs9tV0nDQUuSQiz8rvsz24/NbAl594IPuqzyhDwWIT5tk+McrnMV
         BjeWaQ45XziF4e8RJs1abbdZI32216Y9jE7OYkdn7Nn9OU3SUBjEGo6XxfcGuAUTQ0ZA
         DPVJgl7AiBAEYIrN7nLhMk3ckOxJsrcusk5fv8Kfrr0KNS20pntjHS9wwBArZDUC2tUD
         SyP+qBWcXyaCnF5y22dRvAMS5r12YI++/emIWJb5nKizj5P4j5S/c3CD1RJlnAw23HOE
         TWXw==
X-Gm-Message-State: AOAM530qTsblXZnL1mcHf2GlUKDR857nhG1GC3xuq0i4ugbfGYWwQBDX
        qeeqR78EhO8Bmmkpez9aqGc1Ig==
X-Google-Smtp-Source: ABdhPJxW7tYWFoaDM9xx7fQwBb/TJ933hlG7T8WqStYv4fD6R/wbIkdG8V6LzcI+dhe4bk31oM/OVg==
X-Received: by 2002:a5d:680b:: with SMTP id w11mr51651104wru.73.1600625394539;
        Sun, 20 Sep 2020 11:09:54 -0700 (PDT)
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id h186sm15823702wmf.24.2020.09.20.11.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 11:09:53 -0700 (PDT)
From:   Paul Barker <pbarker@konsulko.com>
To:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/1] Document multiple fan tach support in pwm-fan driver
Date:   Sun, 20 Sep 2020 19:09:39 +0100
Message-Id: <20200920180943.352526-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch updates the device tree bindings to match the changes I'm
about to send for the pwm-fan driver. Those changes will extend the
pwm-fan driver to support multiple fan tachometer inputs.

These changes can also be pulled from:

  https://gitlab.com/pbarker.dev/staging/linux.git
  tag: for-dt-next/pwm-fan_2020-09-20

Paul Barker (1):
  dt-bindings: hwmon: pwm-fan: Support multiple fan tachometer inputs

 .../devicetree/bindings/hwmon/pwm-fan.txt     | 28 +++++++++++++------
 1 file changed, 19 insertions(+), 9 deletions(-)


base-commit: 73f76a41c4ed7def5dc2ec7c33c7e9f94e601a20
-- 
2.28.0

